//
//  GaugeElements.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit

//MARK: - Gradient Scale

class GradientScale: UIView {
    
    private let lineWidth:  CGFloat = 10
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .conic
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        return gradientLayer
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        drawGradient()
    }
}

private extension GradientScale {
    
    func configure() {
        layer.addSublayer(gradientLayer)
        backgroundColor = .clear
    }
    
    func drawGradient() {
        
        gradientLayer.frame = bounds
        gradientLayer.colors = [.clear, .clear, UIColor.green, UIColor.yellow, UIColor.red, .clear, .clear].map { $0.cgColor }
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat.pi, endAngle: 0, clockwise: true)
        let mask = CAShapeLayer()
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        mask.lineWidth = lineWidth
        mask.path = path.cgPath
        gradientLayer.mask = mask
    }
}

//MARK: - Purple Half Circle Gradient

class PurpleHalfCircle: UIView {
    
    private let startColor: UIColor = .accent
    private let endColor: UIColor = .clear
    private let lineWidth: CGFloat = 8
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        return gradientLayer
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        drawHalfCircle()
    }
}

private extension PurpleHalfCircle {
    
    private func configure() {
        layer.addSublayer(gradientLayer)
        backgroundColor = .clear
    }
    
    private func drawHalfCircle() {
        gradientLayer.frame = bounds
        gradientLayer.colors = [startColor, endColor].map { $0.cgColor }
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat.pi, endAngle: 0, clockwise: true)
        let mask = CAShapeLayer()
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        mask.lineWidth = lineWidth
        mask.path = path.cgPath
        gradientLayer.mask = mask
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct GaugeViewElements_Preview: PreviewProvider {
    
    static var previews: some View {
        
        GaugeView()
            .showPreview()
            .background(Color.black)
            .ignoresSafeArea()
    }
}
#endif
