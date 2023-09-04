//
//  LogoutCell.swift
//  HayBase
//
//  Created by Katya Michal on 28.08.2023.
//

import UIKit

final class LogoutCell: UITableViewCell {
    
    
    // MARK: - UI Elements
    
    let separatorLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("log out", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    
    // MARK: - Inits

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

// MARK: - Setup methods

extension LogoutCell {
    
    private func setupViews() {
        contentView.addSubview(separatorLineView)
        contentView.addSubview(logoutButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            separatorLineView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            separatorLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorLineView.heightAnchor.constraint(equalToConstant: 0.2),
            
            
            logoutButton.topAnchor.constraint(equalTo: separatorLineView.bottomAnchor, constant: 20),
            logoutButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            logoutButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
            
            
                                                  
        ])
    }
}
