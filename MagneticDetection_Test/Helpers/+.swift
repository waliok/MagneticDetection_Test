//
//  +.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit

func deg2rad(_ number: CGFloat) -> CGFloat {
    return number * .pi / 180
}

enum FeatureTitle: String {
    
    case infrared = "Infrared\nDetection"
    case bluetooth = "Bluetooth\nDetection"
    case magnetic = "Magnetic\nDetection"
    case antispy = "Antispy\nTips"
}

struct Feature {
    let title: FeatureTitle
    let imageName: String
}

func isBigResolution() -> Bool {
    let mainScreen = UIScreen.main
    let screenSize = mainScreen.bounds.size
    
    // Calculate the aspect ratio
    let aspectRatio = round(1000 * (screenSize.width / screenSize.height)) / 1000
    let bigResolutionAspectRatio = round(1000 * (9.0 / 19.5)) / 1000
    // Check if the aspect ratio matches that of small iPhones on iOS 15
    if aspectRatio <= bigResolutionAspectRatio {
        return true
    } else {
        return false
    }
}
