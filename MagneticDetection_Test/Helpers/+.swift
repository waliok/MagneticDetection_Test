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
