//
//  OrderProductsCollectionCell.swift
//  HayBase
//
//  Created by Katya Michal on 29.08.2023.
//

import UIKit

final class OrderProductsCollectionCell: UICollectionViewCell {
    
    static let cellIdentifier = "OrderProductsCollectionCell"
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Element
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bowl2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}

// MARK: - Setup Methods

extension OrderProductsCollectionCell {
    private func setupView() {
        contentView.addSubview(productImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 50),
            productImageView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
