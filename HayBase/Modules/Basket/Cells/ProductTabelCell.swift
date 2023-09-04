//
//  ProductTableCell.swift
//  HayBase
//
//  Created by Katya Michal on 06.07.2023.
//

import UIKit

// TODO: -  add how many the dame type of product are in the basket(UILabel)


final class ProductTableCell: UITableViewCell {

    // MARK: - UI Elements

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Name Label"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let pricelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "Price: £300"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()

    private let detailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let largeFont = UIFont.systemFont(ofSize: 20)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let buttonImage = UIImage(systemName: "ellipsis", withConfiguration: configuration)
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .systemGray2
        return button
    }()


    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .tertiaryLabel
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
    
    
    // MARK: - Public

    func update(_ product: LocaleProduct) {
        nameLabel.text = product.productName
        pricelLabel.text = "price: " + "£\(product.price)".uppercased()
        productImageView.image = UIImage(named: product.image)
    }
}
// MARK: - Constraints

extension ProductTableCell {

    private func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailButton)
        contentView.addSubview(pricelLabel)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            productImageView.widthAnchor.constraint(equalToConstant: 100),
            
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            
        
        
            detailButton.topAnchor.constraint(equalTo: productImageView.topAnchor),
            detailButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            pricelLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            pricelLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            

        ])
    }
}
