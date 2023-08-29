//
//  ShimmeringLoadable.swift
//  HayBase
//
//  Created by Katya Michal on 22.08.2023.
//

import UIKit

protocol ShimmeringLoadable {}

extension ShimmeringLoadable {
    
    func makeAnimation() -> CABasicAnimation {
        
        let duration: CFTimeInterval = 1.2
        let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        animation.fromValue = UIColor.gradientLightGrey.cgColor
        animation.toValue = UIColor.hayMain.cgColor
        animation.duration = duration
        animation.beginTime = 0.0
        animation.isRemovedOnCompletion = false
        animation.repeatCount = .infinity
       
       return animation
    }
}


