//
//  UIView.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 11/05/23.
//

import UIKit

protocol NftImageTableViewCellScreenDelegate: AnyObject {
    func tappedCloseButton()
    func tappedMagnifyingGlassButton()
}

class NftImageTableViewCellScreen: UIView {
    
    private weak var delegate: NftImageTableViewCellScreenDelegate?
    
    public func delegate(delegate: NftImageTableViewCellScreenDelegate) {
        self.delegate = delegate
    }
    
    lazy var nftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var closedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedCloseButton() {
        delegate?.tappedCloseButton()
    }
    
    lazy var magnifyingGlassButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.addTarget(self, action: #selector(tappedMagnifyingGlassButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedMagnifyingGlassButton() {
        delegate?.tappedMagnifyingGlassButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    private func addViews() {
        addSubview(nftImageView)
        addSubview(closedButton)
        addSubview(magnifyingGlassButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nftImageView.topAnchor.constraint(equalTo: topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closedButton.topAnchor.constraint(equalTo: nftImageView.topAnchor, constant: 30),
            closedButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            closedButton.heightAnchor.constraint(equalToConstant: 35),
            closedButton.widthAnchor.constraint(equalToConstant: 35),
            
            magnifyingGlassButton.bottomAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: -30),
            magnifyingGlassButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            magnifyingGlassButton.heightAnchor.constraint(equalToConstant: 35),
            magnifyingGlassButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
}
