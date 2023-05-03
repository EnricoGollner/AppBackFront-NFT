//
//  LoginVC.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 16/04/23.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var alert: AlertController?
    var auth: Auth?
    
    override func loadView() {
        loginScreen = LoginScreen()
        alert = AlertController(controller: self)
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tapViewDismissKeyboard()
        auth = Auth.auth()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldsDelegate(delegate: self)
        isEnableLoginButton(false)
    }
    
    func validateTextFields() {
        if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) && (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
            isEnableLoginButton(true)
        } else {
            isEnableLoginButton(false)
        }
    }
    
    func isEnableLoginButton(_ isEnable: Bool) {
        if isEnable {
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.subLoginImageView.alpha = 1
        } else {
            loginScreen?.loginButton.setTitleColor(.lightGray, for: .normal)
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.subLoginImageView.alpha = 0.5
        }
    }

}

extension LoginVC: LoginScreenProtocol {
    func tappedLoginButton() {
        guard let email = loginScreen?.emailTextField.text,
              let password = loginScreen?.passwordTextField.text else { return }
        
        auth?.signIn(withEmail: email, password: password, completion: { user, error in
            if error != nil {
                self.alert?.getAlert(title: "Login Failed", messsage: error?.localizedDescription ?? "") {
                    print("Pressionou o botão")
                }
            } else {
                // sucesso
                print("Loged-in!")
            }
        })
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
                
            case self.loginScreen?.emailTextField:
                if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    loginScreen?.emailTextField.layer.borderWidth = 1
                    loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.emailTextField.layer.borderWidth = 1.5
                    loginScreen?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
                
            case self.loginScreen?.passwordTextField:
                if (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    loginScreen?.passwordTextField.layer.borderWidth = 0
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.passwordTextField.layer.borderWidth = 1.5
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
        
        validateTextFields()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

