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
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createGradient() {
        let animationGroup = makeAnimation()
        animationGroup.beginTime = 0.0
        shimmeringLayer.add(animationGroup, forKey: "backgroudColour")
        shimmeringLayer.frame = self.bounds
        layer.addSublayer(shimmeringLayer)
    }
}

extension ShimmeringView: ShimmeringLoadable {}
