//
//  ShimmeringLoadable.swift
//  HayBase
//
//  Created by Katya Michal on 22.08.2023.
//

import UIKit

protocol ShimmeringLoadable {}

extension ShimmeringLoadable {
    
    func makeAnimationGroup() -> CABasicAnimation {
        
        let duration: CFTimeInterval = 1.2
        let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        animation.fromValue = UIColor.gradientLightGrey.cgColor
        animation.toValue = UIColor.gradientDarkGrey.cgColor
        animation.duration = duration
        animation.beginTime = 0.0
        animation.isRemovedOnCompletion = false
        animation.repeatCount = .infinity
       
        
//        let group = CAAnimationGroup()
//        group.animations = [animation]
//        group.repeatCount = .greatestFiniteMagnitude
//        group.duration = animation.beginTime + animation.duration
//        group.isRemovedOnCompletion = false
//
//        return group
        
       return animation
    }
}


