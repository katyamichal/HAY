//
//  DesignerProductsCell.swift
//  HayBase
//
//  Created by Katya Michal on 08.07.2023.
//

import UIKit

final class DesignerProductsCell: UICollectionViewCell {
    
    static let cellIdentifier = "DesignerProductsCell"
    
    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public
    func update(_ designerProduct: LocalProduct) {
        nameLabel.text = designerProduct.productName.lowercased()
        pricelLabel.text = "\(designerProduct.price) £"
        productImageView.image = UIImage(named: designerProduct.image)
        likeButton.product = designerProduct
        likeButton.isSelected = designerProduct.isFavourite
       // likeButton.type = .designer
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let pricelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price"
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
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

extension DesignerProductsCell {
    
      private func setupViews() {
          contentView.addSubview(productImageView)
          contentView.addSubview(verticalStackView)
          contentView.addSubview(likeButton)
          verticalStackView.addArrangedSubview(nameLabel)
          verticalStackView.addArrangedSubview(pricelLabel)
      }
    
    
      private func setupConstraints() {
          
          NSLayoutConstraint.activate([
            
            likeButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 16),
            likeButton.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -1),
           
            likeButton.widthAnchor.constraint(equalToConstant: 25),
            likeButton.heightAnchor.constraint(equalToConstant: 25),
            
            productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -8),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            

            verticalStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            verticalStackView.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            
          ])
      }
}

