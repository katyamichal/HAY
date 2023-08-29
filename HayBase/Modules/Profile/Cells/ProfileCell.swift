//
//  ProfileCell.swift
//  HayBase
//
//  Created by Katya Michal on 28.08.2023.
//

import UIKit

final class ProfileCell: UITableViewCell {
    
    // MARK: - UI Elenents
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
 
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .profile
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .light)
        let image = UIImage(systemName: "camera", withConfiguration: imageConfiguration)
        
        imageView.tintColor = .black
        imageView.image = image
        imageView.layer.cornerRadius = 35
        
        return imageView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.text = "Katya"
        return label
    }()
    
    
    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.text = "Michal"
        return label
    }()
    
    private let detailImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false

        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        let image = UIImage(systemName: "ellipsis", withConfiguration: imageConfiguration)
        imageView.tintColor = .black
        
        imageView.image = image
        
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

extension ProfileCell {
    
    private func setupViews() {

        contentView.addSubview(profileImageView)
       
        contentView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(surnameLabel)
        
        contentView.addSubview(detailImageView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
        
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            
            
            verticalStackView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            
            
            detailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            detailImageView.leadingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            detailImageView.widthAnchor.constraint(equalToConstant: 20)
            
        ])
        
    }
    
}
