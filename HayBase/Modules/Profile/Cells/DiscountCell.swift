//
//  DiscountCell.swift
//  HayBase
//
//  Created by Katya Michal on 31.08.2023.
//

import UIKit

final class DiscountCell: UITableViewCell {
    
    
    // MARK: - UI Elements
    
    private let background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colours.Profile.profileDark
        view.layer.cornerRadius = 15
     
        return view
    }()
    
    private let headerPercentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "your personal discount".uppercased()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "17 %".uppercased()
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.textColor = .white
        return label
    }()

    private let bonusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "bonus: 83"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .white
        return label
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

// MARK: - Setip methods


extension DiscountCell {
    private func setupViews() {
        contentView.addSubview(background)
        background.addSubview(headerPercentageLabel)
        background.addSubview(percentageLabel)
        background.addSubview(bonusLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            background.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
      
            background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            
            background.widthAnchor.constraint(equalToConstant: Layout.width / 1.2),
            background.heightAnchor.constraint(equalToConstant: 200),
            
            
            headerPercentageLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 20),
            headerPercentageLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 16),
            
            percentageLabel.topAnchor.constraint(equalTo: headerPercentageLabel.bottomAnchor, constant: 8),
            percentageLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 16),
            
            
            bonusLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -20),
            bonusLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -16),
            
        ])
    }
}
