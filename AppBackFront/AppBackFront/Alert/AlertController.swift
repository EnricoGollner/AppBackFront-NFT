//
//  AlertController.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 02/05/23.
//

import UIKit

class AlertController: NSObject {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, messsage: String, completion: (() -> Void)? = nil ) {
        let alertController = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) { share in
            completion?()
        }
        alertController.addAction(ok)
        self.controller.present(alertController, animated: true)
    }
    
}
