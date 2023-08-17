//
//  LikeButton.swift
//  HayBase
//
//  Created by Katya Michal on 09.08.2023.
//

import UIKit

class LikeButton: UIButton {
    
    var onLikeButtonPressed: ((Bool, LocalProduct)->())?
    
    var product: LocalProduct?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        self.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        let largeFont = UIFont.systemFont(ofSize: 20)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        
        
        let selectedImage = UIImage(systemName: "heart", withConfiguration: configuration)
        self.setImage(selectedImage, for: .normal)
        
        let unselectedImage = UIImage(systemName: "heart.fill", withConfiguration: configuration)
        self.setImage(unselectedImage, for: .selected)
        
        self.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        self.tintColor = .label
     
    }
    
    @objc
    func likeButtonTapped() {
        if self.isSelected {
            self.isSelected = false

            guard var product else {return}
            product.isFavourite = false
            self.onLikeButtonPressed?(false, product)
           

        } else {
            self.isSelected = true
            guard var product else {return}
            product.isFavourite = true
            self.onLikeButtonPressed?(true, product)
        }
        
       
    }
}

