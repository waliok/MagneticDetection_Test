//
//  GaugeView.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit

class GaugeView: UIView {
    
    let valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.textColor = .white
        valueLabel.text = "Search checking"
        valueLabel.font = .robotoFont(ofSize: 17, weight: .medium)
        
        return valueLabel
    }()
    private let gradientScaleView = GradientScale()
    private let purpleHalfCircleView = PurpleHalfCircle()
    private let scaleView = UIImageView(image: .scale)
    private let needleView = UIImageView(image: .needle)
    private var valueColor = UIColor.white
    private var totalAngle: CGFloat = 180
    private var rotation: CGFloat = 0
    
    var value: Int = 0 {
        didSet {
            // update the value label to show the exact number
            valueLabel.text = String(value) + " µt"
            
            // figure out where the needle is, between 0 and 1
            let needlePosition = CGFloat(value) / 100
            
            // create a lerp from the start angle (rotation) through to the end angle (rotation + totalAngle)
            let lerpFrom = rotation
            let lerpTo = rotation + totalAngle
            
            // lerp from the start to the end position, based on the needle's position
            let needleRotation = lerpFrom + (lerpTo - lerpFrom) * needlePosition
            needleView.transform = CGAffineTransform(rotationAngle: deg2rad(needleRotation))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        otherSetups()
        setupViewsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        otherSetups()
        setupViewsAndConstraints()
    }
    
    private func otherSetups() {
        
        needleView.layer.anchorPoint = CGPoint(x: 0.84, y: 0.5)
    }
    
    private func setupViewsAndConstraints() {
        
        addSubview(gradientScaleView)
        addSubview(scaleView)
        addSubview(purpleHalfCircleView)
        addSubview(needleView)
        addSubview(valueLabel)
        
        valueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(150)
        }
        
        scaleView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        gradientScaleView.snp.makeConstraints { make in
            make.width.equalTo(scaleView).offset(140)
            make.height.equalTo(scaleView).offset(145)
            make.top.equalTo(scaleView).offset(11)
            make.centerX.equalTo(scaleView)
        }
        
        needleView.snp.makeConstraints { make in
            make.bottom.equalTo(scaleView)
            make.centerX.equalTo(scaleView)
        }
        
        purpleHalfCircleView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.bottom.equalTo(scaleView).offset(60)
            make.centerX.equalTo(scaleView)
        }
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct GaugeView_Preview: PreviewProvider {
    
    static var previews: some View {
        
        GaugeView()
            .showPreview()
            .background(Color.black)
            .ignoresSafeArea()
    }
}
#endif
