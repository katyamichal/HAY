//
//  LikeButton.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 09.08.2023.
//

import UIKit

class LikeButton: UIButton {

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
    }
    
    @objc
    func likeButtonTapped() {
        if self.isSelected == true {
            self.isSelected = false
        } else {
            self.isSelected = true
        }
    }
    
}

//let button = UIButton()
//button.translatesAutoresizingMaskIntoConstraints = false
//let largeFont = UIFont.systemFont(ofSize: 20)
//let configuration = UIImage.SymbolConfiguration(font: largeFont)
//let image = UIImage(systemName: "heart", withConfiguration: configuration)
//
//button.setImage(image, for: .normal)
//button.tintColor = .systemGray2
//button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
//// target --> closure
//return button
