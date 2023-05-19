//
//  NFTFilterCollectionViewCell.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 07/05/23.
//

import UIKit

class NFTFilterCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: NFTFilterCollectionViewCell.self)  // Estamos transformando em String o nome "NFTFilterCollectionViewCell, com o .self, referenciamos o nome (mesma coisa que viemos fazendo até então com escrever o próprio nome), porém aqui, indicará caso trocarmos o nome da Class e não trocarmos o identifier.
    
    private lazy var screen: NFTFilterCollectionViewCellScreen = {
        let view = NFTFilterCollectionViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    public func setUpCell(filter: FilterNft) {
        screen.filterLabel.text = filter.title ?? ""
        if filter.isSelected ?? false {
            screen.filterLabel.backgroundColor = .purple
        } else {
            screen.filterLabel.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        }
    }
    
}
