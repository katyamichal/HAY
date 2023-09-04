//
//  InfoCell.swift
//  HayBase
//
//  Created by Katya Michal on 29.08.2023.
//

import UIKit

final class OrderAddressCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private let circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 5, weight: .light)
        let image = UIImage(systemName: "circle.fill", withConfiguration: imageConfiguration)
        imageView.image = image
        imageView.tintColor = .black
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "address and shipping"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    
    private let addressDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "HAY ApS  Havnen 1, 8700 Horsens, Denmark"
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .black
        return label
    }()

    private let accessory: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 10, weight: .regular)
        let image = UIImage(systemName: "chevron.right", withConfiguration: imageConfiguration)
        imageView.image = image
        imageView.tintColor = .black
        return imageView
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

extension OrderAddressCell {
    
    private func setupViews() {
        contentView.addSubview(circleImageView)
        contentView.addSubview(headerLabel)
        contentView.addSubview(addressDetailLabel)
        contentView.addSubview(accessory)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
           
        
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: 22),
            
            
            circleImageView.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            circleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            circleImageView.widthAnchor.constraint(equalToConstant: 10),
            circleImageView.heightAnchor.constraint(equalToConstant: 10),
            
            addressDetailLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 6),
            addressDetailLabel.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: 22),
            addressDetailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            addressDetailLabel.trailingAnchor.constraint(equalTo: accessory.leadingAnchor),
            
            
            
            accessory.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            accessory.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        
            accessory.heightAnchor.constraint(equalToConstant: 13),
            accessory.widthAnchor.constraint(equalToConstant: 8)
            
        ])
        
    }
    
}
