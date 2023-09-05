//
//  InspirationTableHeaderLoadView.swift
//  HayBase
//
//  Created by Katya Michal on 13.07.2023.
//

import UIKit

class ShimmeringView: UIView {
    
    private let shimmeringLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.colors = [Colours.Gradient.gradientSilverGrey]
        return layer
    }()
    
    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - <#Section Heading#>

    private func commonInit() {
        shimmeringLayer.colors = [Colours.Gradient.gradientSilverGrey.cgColor, Colours.Gradient.gradientSilverGrey.cgColor]
        layer.addSublayer(shimmeringLayer)
    }
    
    // MARK: - Subview

    override func layoutSubviews() {
        super.layoutSubviews()
        if shimmeringLayer.frame != bounds {
            shimmeringLayer.frame = bounds
        }
        let newColors = [Colours.Gradient.gradientSilverGrey.cgColor, Colours.Gradient.gradientLightGrey.cgColor]
        
        shimmeringLayer.setColours(newColors)
    }
}
