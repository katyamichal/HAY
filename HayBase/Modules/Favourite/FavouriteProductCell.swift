//
//  FavouriteProductCell.swift
//  HayBase
//
//  Created by Katya Michal on 01.08.2023.
//

//import UIKit
///// try with callback
//
//class FavouriteProductCell: UICollectionViewCell {
//    
//    static let cellIdentifier = "FavouriteProductCell"
//    
//
//    // MARK: - Inits
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Public
//    
//    func update(_ product: LocalProduct?) {
//        guard let product else {return}
//        nameLabel.text = product.productName.lowercased()
//        pricelLabel.text = "\(product.price) £"
//        productImageView.image = UIImage(named: product.image)
//    }
//    
//    // MARK: - UI Elements
//    
//    private let verticalStackView: UIStackView = {
//        var stackView = UIStackView.init()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 8
//        stackView.alignment = .leading
//        stackView.isLayoutMarginsRelativeArrangement = true
//        return stackView
//    }()
//    
//    private let nameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.font = UIFont.boldSystemFont(ofSize: 15)
//        return label
//    }()
//    
//    private let buyButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        let largeFont = UIFont.systemFont(ofSize: 16)
//        let configuration = UIImage.SymbolConfiguration(font: largeFont)
//        let image = UIImage(systemName: "bag", withConfiguration: configuration)
//        button.backgroundColor = .black
//        button.layer.cornerRadius = 18
//        button.setImage(image, for: .normal)
//        button.tintColor = .white
//        return button
//    }()
//    
//    private let pricelLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Price"
//        label.textColor = .label
//        label.numberOfLines = 0
//        label.font = UIFont.boldSystemFont(ofSize: 13)
//        return label
//    }()
//    
//    private let productImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//    
//     let likeButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        let largeFont = UIFont.systemFont(ofSize: 20)
//        let configuration = UIImage.SymbolConfiguration(font: largeFont)
//        let image = UIImage(systemName: "heart.fill", withConfiguration: configuration)
//        button.setImage(image, for: .normal)
//        button.tintColor = .black
//      
//        return button
//    }()
//    
// 
//
//}
//// MARK: - Setup methods
//
//
//extension FavouriteProductCell {
//    
//    private func setupViews() {
//        contentView.addSubview(productImageView)
//        contentView.addSubview(verticalStackView)
//        
//        contentView.addSubview(buyButton)
//        contentView.addSubview(likeButton)
//        
//        verticalStackView.addArrangedSubview(nameLabel)
//        verticalStackView.addArrangedSubview(pricelLabel)
//    }
//    
//    private func setupConstraints() {
//        
//        NSLayoutConstraint.activate([
//            
//            likeButton.topAnchor.constraint(equalTo: productImageView.topAnchor, constant: 6),
//            likeButton.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -6),
//            
//            likeButton.widthAnchor.constraint(equalToConstant: 25),
//            likeButton.heightAnchor.constraint(equalToConstant: 25),
//            
//            productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
//            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -8),
//            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            
//            buyButton.widthAnchor.constraint(equalToConstant: 35),
//            buyButton.heightAnchor.constraint(equalToConstant: 35),
//            buyButton.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -6),
//            buyButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: -15),
//            
//            
//            verticalStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
//            verticalStackView.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -20),
//            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            
//        ])
//    }
//}
//

