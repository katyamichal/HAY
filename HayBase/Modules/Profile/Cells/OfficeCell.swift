//
//  OfficeCell.swift
//  HayBase
//
//  Created by Katya Michal on 28.08.2023.
//

import UIKit

final class OfficeCell: UITableViewCell {
    
    // MARK: - UI Element
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let accessory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .regular)
        let image = UIImage(systemName: "chevron.forward", withConfiguration: imageConfiguration)
        imageView.tintColor = .black
        imageView.image = image
        return imageView
    }()
    
    
    // MARK: - Public
    
    func update(productInfo: String) {
        typeLabel.text = productInfo
    }
    
    
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

extension OfficeCell {
    
    private func setupViews() {
        contentView.addSubview(typeLabel)
        contentView.addSubview(accessory)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            typeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            typeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            accessory.centerYAnchor.constraint(equalTo: typeLabel.centerYAnchor),
            accessory.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            accessory.widthAnchor.constraint(equalToConstant: 8),
            accessory.heightAnchor.constraint(equalToConstant: 13)
            
        ])
    }
}

