//
//  BuyButton.swift
//  HayBase
//
//  Created by Katya Michal on 20.08.2023.
//
import UIKit

class BuyButton: UIButton {
    
    var onBuyButtonPressed: ((LocaleProduct)->())?
    
    var product: LocaleProduct?
    
    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup methods

  private func setupButton() {
        self.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        let largeFont = UIFont.systemFont(ofSize: 16)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        
        
        let buttonImage = UIImage(systemName: "bag", withConfiguration: configuration)
      
        self.setImage(buttonImage, for: .normal)
        self.setImage(buttonImage, for: .selected)
        
        self.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    
      self.backgroundColor = .black
      self.layer.cornerRadius = 18
    
      self.tintColor = .white
  }
    
    @objc
    private func buyButtonTapped() {
        
        UIView.animate(withDuration: 0.6,
            animations: {
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.6) {
                    self.transform = CGAffineTransform.identity
                }
            })
    
       
        guard var product else {return}
        product.isInCart = true
        self.onBuyButtonPressed?(product)
        
    }
    
}

