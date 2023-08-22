//
//  ProductActionsCell.swift
//  HayBase
//
//  Created by Katya Michal on 22.08.2023.
//

import UIKit

final class ProductActions: UIView {
    
    private let favouriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Place you", for: .normal)
        button.backgroundColor = .black
      
        return button
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Place your order", for: .normal)
        button.backgroundColor = .black
      
        return button
    }()
}
