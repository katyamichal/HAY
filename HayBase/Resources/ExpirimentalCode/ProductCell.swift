//
//  ProductCollectionViewCell.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 05.07.2023.
//

//import UIKit
//
//final class ProductCell: UITableViewCell {
//    
//    // MARK: - UI Elements
//
//    private let verticalStackView: UIStackView = {
//        var stackView = UIStackView.init()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 16
//        stackView.alignment = .leading
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 8, trailing: 0)
//        stackView.isLayoutMarginsRelativeArrangement = true
//
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
//    private let detailLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .label
//        label.numberOfLines = 0
//        label.font = UIFont.boldSystemFont(ofSize: 13)
//        return label
//    }()
//    
//    private let pricelLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .label
//        label.numberOfLines = 0
//        label.font = UIFont.boldSystemFont(ofSize: 13)
//        return label
//    }()
//    
//    private let productImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return imageView
//    }()
//
//    // MARK: - Inits
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        setupViews()
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func update(_ product: Product) {
//        nameLabel.text = product.name.uppercased()
//        detailLabel.text = product.detail.uppercased()
//        pricelLabel.text = "\(product.price) £".uppercased()
//        productImageView.image = UIImage(named: product.image)
//    }
//}
//// MARK: - Constraints
//
//extension ProductCell {
//  
//    private func setupViews() {
//        contentView.addSubview(productImageView)
//        contentView.addSubview(verticalStackView)
//        verticalStackView.addArrangedSubview(nameLabel)
//        verticalStackView.addArrangedSubview(detailLabel)
//        verticalStackView.addArrangedSubview(pricelLabel)
//    }
//    
//    private func setupConstraints() {
//        let constant: CGFloat = 8
//        
//        NSLayoutConstraint.activate([
//            productImageView.heightAnchor.constraint(equalToConstant: 0.33 * Layout.width),
//            productImageView.widthAnchor.constraint(equalToConstant: 0.33 * Layout.width),
//            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constant),
//            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            
//            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: constant),
//            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -constant),
//            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -constant),
//            verticalStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: constant),
//            
//        ])
//    }
//}
