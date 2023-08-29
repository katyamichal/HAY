//
//  ReceiverCell.swift
//  HayBase
//
//  Created by Katya Michal on 29.08.2023.
//

import UIKit

final class ReceiverCell: UITableViewCell {
    
    
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
    
    private let receiverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "receiver"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    
    private let receiverNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "Katya Michal"
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .black
        return label
    }()
    
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let mobileNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "+34 6549955"
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .black
        return label
    }()
    
    
    private let mailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "katyamichal@gmail.com"
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .black
        return label
    }()
    
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .regular)
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

extension ReceiverCell {
    
    private func setupViews() {
        contentView.addSubview(circleImageView)
        contentView.addSubview(receiverLabel)
        contentView.addSubview(receiverNameLabel)
        contentView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(mobileNumberLabel)
        verticalStackView.addArrangedSubview(mailLabel)
       

        contentView.addSubview(chevronImageView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
           
        
            receiverLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            receiverLabel.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: 22),
            
            
            circleImageView.centerYAnchor.constraint(equalTo: receiverLabel.centerYAnchor),
            circleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            circleImageView.widthAnchor.constraint(equalToConstant: 10),
            circleImageView.heightAnchor.constraint(equalToConstant: 10),
            
            receiverNameLabel.topAnchor.constraint(equalTo: receiverLabel.bottomAnchor, constant: 6),
            receiverNameLabel.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: 22),
            receiverNameLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: receiverNameLabel.bottomAnchor, constant: 10),
            
            verticalStackView.leadingAnchor.constraint(equalTo: receiverLabel.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            
            
            chevronImageView.topAnchor.constraint(equalTo: receiverLabel.topAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        
            chevronImageView.heightAnchor.constraint(equalToConstant: 20),
            chevronImageView.widthAnchor.constraint(equalToConstant: 15)
            
        ])
        
    }
    

}
