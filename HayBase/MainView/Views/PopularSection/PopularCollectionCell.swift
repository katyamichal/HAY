//
//  PopularProductCVCell.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 06.07.2023.
//

import UIKit

class PopularProductCVCell: UICollectionViewCell {
    
    static let cellIdentifier = "PopularProductCVCell"
    
    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements

    private let verticalStackView: UIStackView = {
        var stackView = UIStackView.init()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 3, trailing: 0)
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
    
//    private let detailLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Detail"
//        label.textColor = .label
//        label.numberOfLines = 0
//        label.font = UIFont.boldSystemFont(ofSize: 13)
//        return label
//    }()
//    
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
        return imageView
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let largeFont = UIFont.systemFont(ofSize: 20)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let image = UIImage(systemName: "heart", withConfiguration: configuration)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    
    // MARK: - Public
    
    func update(_ product: Product) {
        nameLabel.text = product.productName
       // detailLabel.text = product.
        pricelLabel.text = "\(product.price) £"
        productImageView.image = UIImage(named: product.image)
    }
}

// MARK: - Setups

extension PopularProductCVCell {
    
      private func setupViews() {
          contentView.addSubview(productImageView)
          contentView.addSubview(verticalStackView)
          contentView.addSubview(likeButton)
          verticalStackView.addArrangedSubview(nameLabel)
       //   verticalStackView.addArrangedSubview(detailLabel)
          verticalStackView.addArrangedSubview(pricelLabel)
      }
    
      private func setupConstraints() {
          
          NSLayoutConstraint.activate([
            
            likeButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 16),
            likeButton.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -1),
            likeButton.widthAnchor.constraint(equalToConstant: 25),
            likeButton.heightAnchor.constraint(equalToConstant: 25),
            
            productImageView.heightAnchor.constraint(equalToConstant: Layout.width * 0.6),
            productImageView.widthAnchor.constraint(equalToConstant: Layout.width * 0.6),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

            
            
            verticalStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
          ])
      }
}
