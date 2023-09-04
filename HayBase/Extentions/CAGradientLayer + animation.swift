//
//  .swift
//  HayBase
//
//  Created by Katya Michal on 22.08.2023.
//

import UIKit

extension CAGradientLayer {
    
    func setColours(_ newColours: [CGColor],
                    animated: Bool = true,
                    withDuration duration: TimeInterval = 2,
                    timingFuncName name: CAMediaTimingFunctionName? = nil) {
        if !animated {
            self.colors = newColours
            return
        }
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = colors
        colorAnimation.toValue = newColours
        colorAnimation.duration = duration
        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.repeatCount = .greatestFiniteMagnitude
        colorAnimation.fillMode = CAMediaTimingFillMode.forwards
        colorAnimation.timingFunction = CAMediaTimingFunction(name: name ?? .linear)
        
        add(colorAnimation, forKey: "colorsChangeAnimation")
    }
}
