//
//  ProductActionsCell.swift
//  HayBase
//
//  Created by Katya Michal on 22.08.2023.
//

import UIKit

final class ProductActionsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let favouriteButton: LikeButton = {
        let button = LikeButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Colours.Main.hayBackground
        button.backgroundColor = .black
        return button
    }()
    
    private let basketButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Add to Basket", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    func update(product: LocaleProduct) {
        favouriteButton.product = product
        
        if product.isInCart {
            basketButton.setTitle("Add more", for: .normal)
        }
        if product.isFavourite {
            favouriteButton.isSelected = true
        }
    }
}

extension ProductActionsView {
    
    private func setupViews() {
        addSubview(favouriteButton)
        addSubview(basketButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            basketButton.topAnchor.constraint(equalTo: topAnchor),
            basketButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            basketButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            basketButton.widthAnchor.constraint(equalToConstant: Layout.width / 1.3),
            
            favouriteButton.topAnchor.constraint(equalTo: topAnchor),
            favouriteButton.leadingAnchor.constraint(equalTo: basketButton.trailingAnchor, constant: 10),
            favouriteButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            favouriteButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}
