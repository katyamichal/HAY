//
//  InspirationCollectionCell.swift
//  HayBase
//
//  Created by Katya Michal on 11.07.2023.
//

import UIKit

class InspirationCollectionCell: UICollectionViewCell {
    static let cellIdentifier = "InspirationCollectionCell"
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "apron")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private func setupView() {
        contentView.addSubview(imageView)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
       
    }
    
    func update(_ inspirationProduct: Product) {
        imageView.image = UIImage(named: inspirationProduct.image)
    }
}
