//
//  BasicProductCell.swift
//  HayBase
//
//  Created by Katya Michal on 27.07.2023.
//

/// USED IN:
/// -  Favourite Module
/// - Inspiration Module

import UIKit


final class BasicProductCell: UICollectionViewCell {
        
    var product: LocaleProduct?
    
    static let cellIdentifier = "InspoProductCell"
    
    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        nameLabel.text = nil
        pricelLabel.text = nil
        productImageView.image = nil
        likeButton.isSelected = false
    }
    
    // MARK: - Public
    func update(_ product: LocaleProduct) {
        nameLabel.text = product.productName.lowercased()
        pricelLabel.text = "\(product.price) £"
        productImageView.image = UIImage(named: product.image)
        
        likeButton.product = product
        likeButton.isSelected = product.isFavourite
        
        buyButton.product = product
        
    }
    
    // MARK: - UI Element
    
    private let verticalStackView: UIStackView = {
        var stackView = UIStackView.init()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
     let buyButton: BuyButton = {
        let button = BuyButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pricelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
   var likeButton: LikeButton = {
        let button = LikeButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
}
// MARK: - setup methods

extension BasicProductCell {
    
      private func setupViews() {
          contentView.addSubview(productImageView)
          contentView.addSubview(verticalStackView)
          
          contentView.addSubview(buyButton)
          contentView.addSubview(likeButton)
          
          verticalStackView.addArrangedSubview(nameLabel)
          verticalStackView.addArrangedSubview(pricelLabel)
      }
    
      private func setupConstraints() {
          
          NSLayoutConstraint.activate([
            
            likeButton.topAnchor.constraint(equalTo: productImageView.topAnchor, constant: 6),
            likeButton.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -6),
           
            likeButton.widthAnchor.constraint(equalToConstant: 25),
            likeButton.heightAnchor.constraint(equalToConstant: 25),
            
            productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            buyButton.widthAnchor.constraint(equalToConstant: 35),
            buyButton.heightAnchor.constraint(equalToConstant: 35),
            buyButton.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -6),
            buyButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: -15),
            

            verticalStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            verticalStackView.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -20),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
          ])
      }
}
