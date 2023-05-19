//
//  ListOfTransactionTableViewCell.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 16/05/23.
//

import UIKit

class ListOfTransactionTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: ListOfTransactionTableViewCell.self)
    
    private lazy var screen: ListOfTransactionTableViewCellScreen = {
        let view = ListOfTransactionTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        addViews()
        configConstraints()
    }
    
    private func addViews() {
        contentView.addSubview(screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setUpCell(data: ListOfTransaction, isInitial: Bool, isFinal: Bool) {
        screen.idTransactionLabel.text = data.idTransaction ?? ""
        screen.transactionImageView.image = UIImage(named: data.image ?? "")
        screen.priceEthLabel.text = "\(data.priceEth ?? 0) ETH"
        screen.valueInDollarLabel.text = "$\(data.valueDollar ?? 0)"
        screen.dateAndHourLabel.text = data.dateAndHour ?? ""
        
        if data.type == "exit" {
                    screen.priceEthLabel.text = "-\(data.priceEth ?? 0) ETH"
                    screen.priceEthLabel.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
                    screen.valueInDollarLabel.textColor = UIColor(red: 122/255, green: 235/255, blue: 255/255, alpha: 1)
                    screen.dateAndHourLabel.textColor = UIColor(red: 122/255, green: 235/255, blue: 255/255, alpha: 1)
                } else {
                    screen.priceEthLabel.text = "+\(data.priceEth ?? 0) ETH"
                    screen.priceEthLabel.textColor = UIColor(red: 183/255, green: 0/255, blue: 170/255, alpha: 1)
                    screen.valueInDollarLabel.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
                    screen.dateAndHourLabel.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
                }
        
        screen.layer.borderColor = UIColor.white.cgColor
        screen.layer.borderWidth = 0.5
        
        
        if isInitial {
            screen.roundCorners(cornerRadius: 20, typeCorners: [.topLeft, .topRight])
        }
        
        if isFinal {
            screen.roundCorners(cornerRadius: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
    }
    
}


