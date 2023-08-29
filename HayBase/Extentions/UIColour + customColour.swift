//
//  UIColour + customColour.swift
//  HayBase
//
//  Created by Katya Michal on 22.08.2023.
//

import UIKit

//enum ColourPallete: String {
//    case hayMain
//    case gradientDarkGrey
//    case gradientLightGrey
//
//}


extension UIColor {
    
    
    
    static var gradientDarkGrey: UIColor {
        return UIColor(red: 238 / 255.0, green: 238 / 255.0, blue: 238 / 255.0, alpha: 1)
    }
    
    static var gradientLightGrey: UIColor {
        return UIColor(red: 233 / 255.0, green: 233 / 255.0, blue: 233 / 255.0, alpha: 1)
    }
    
    static var productDescription: UIColor {
        return UIColor(red: 236 / 255.0, green: 236 / 255.0, blue: 236 / 255.0, alpha: 1)
    }
    
    static var hayMain: UIColor {
        return UIColor(red: 242 / 255.0, green: 242 / 255.0, blue: 242 / 255.0, alpha: 1)
    }
    
    static var profile: UIColor {
        return UIColor(red: 193 / 255.0, green: 207 / 255.0, blue: 216 / 255.0, alpha: 1)
    }
}




//static var colourStore: [String: UIColor] = [:]
//
//    static func rgba(pallete: ColourPallete) -> UIColor {
//
//        let key = pallete.rawValue
//
//        if let colour = colourStore[key] {
//            return colour
//        } else {
//
//            let newColour: UIColor
//            switch pallete {
//            case .hayMain:
//                newColour = UIColor(red: 243 / 255.0, green: 238 / 255.0, blue: 232 / 255.0, alpha: 1)
//            case .gradientDarkGrey:
//                newColour = UIColor(red: 233 / 255.0, green: 233 / 255.0, blue: 233 / 255.0, alpha: 1)
//            case .gradientLightGrey:
//                newColour = UIColor(red: 233 / 255.0, green: 233 / 255.0, blue: 233 / 255.0, alpha: 1)
//            }
//            colourStore[key] = newColour
//            return newColour
//        }
//
//    }
