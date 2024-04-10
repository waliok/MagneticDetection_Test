//
//  Font+.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit

extension UIFont {
    
    enum RobotoFont {
        case bold
        case medium
        case regular
        
        var value: String {
            switch self {
                
            case .medium:
                return "Roboto-Medium"
                
            case .bold:
                return "Roboto-Bold"
                
            case .regular:
                return "Roboto-Regular"
            }
        }
    }
    
    static func robotoFont(ofSize: CGFloat, weight: RobotoFont = .regular) -> UIFont {
        
        if let font = UIFont(name: weight.value, size: ofSize) {
            return font
        } else {
            print("Error loading the Roboto Medium font.")
            return UIFont.systemFont(ofSize: ofSize, weight: .regular)
        }
    }
}
