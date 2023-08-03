//
//  UIButton + pointInside.swift
//  HayBase
//
//  Created by Katya Michal on 01.08.2023.
//

import UIKit

class CustomButton: UIButton {
    
    var touchAreaPadding: UIEdgeInsets?
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        guard let insets = touchAreaPadding else {
            
            return super.point(inside: point, with: event)
        }
        
        let rect = bounds.inset(by: insets.inverted())
        
        return rect.contains(point)
    }
}

extension UIEdgeInsets {
    
    func inverted() -> UIEdgeInsets {
        return UIEdgeInsets(top: -top, left: -left,
                            bottom: -bottom, right: -right)
    }
}
