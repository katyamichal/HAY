//
//  UIColour + customColour.swift
//  HayBase
//
//  Created by Katya Michal on 22.08.2023.
//

import UIKit

enum Colours {
    
    enum Main {
        static let hayAccent = UIColor.rgba(red: 210, green: 186, blue: 159, alpha: 1)
        
        static let hayBackground = UIColor.rgba(red: 242, green: 242, blue: 242, alpha: 1)
        
        static let productDescription = UIColor.rgba(red: 236, green: 236, blue: 236, alpha: 1)
    }
    
    enum Gradient {
        static let gradientSilverGrey = UIColor.rgba(red: 200, green: 211, blue: 214, alpha: 1)
        
        static let gradientLightGrey = UIColor.rgba(red: 252, green: 250, blue: 251, alpha: 1)
    }
    
    enum Profile {
        static let profileDark = UIColor.rgba(red: 6, green: 148, blue: 198, alpha: 1)
        
        static let profileLight = UIColor.rgba(red: 210, green: 255, blue: 255, alpha: 1)
    }
}

extension UIColor {
    
    private static var colourCache: [String: UIColor] = [:]
    
    public static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        
        let key = "\(red)\(green)\(blue)\(alpha)"
        if let cachedColour = self.colourCache[key] {
            return cachedColour
        }
        self.clearColourCacheIfNeeded()
        let colour = UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
        self.colourCache[key] = colour
        
        return colour
    }
    
    private static func clearColourCacheIfNeeded() {
        let maxObjectCount = 100
        
        guard self.colourCache .count >= maxObjectCount else {return}
        self.colourCache = [:]
    }
}


