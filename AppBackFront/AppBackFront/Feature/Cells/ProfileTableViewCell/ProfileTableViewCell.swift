//
//  ProfileTableViewCell.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 19/05/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: ProfileTableViewCell.self)
    
    lazy var screen: ProfileTableViewCellScreen = {
        let view = ProfileTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    public func setUpCell(delegate: ProfileTableViewCellScreenDelegate) {
        screen.delegate(delegate: delegate)
    }
    
}
