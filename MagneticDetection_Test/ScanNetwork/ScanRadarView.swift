//
//  ScanRadarView.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit
import Lottie

class ScanRadarView: UIView {

    var animationView: LottieAnimationView!
    var percentLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.font = .robotoFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewsAndConstraints()
    }
    
    func setupViewsAndConstraints() {
        backgroundColor = .clear
        animationView = .init(name: "searchAnimation")
        addSubview(animationView)
        addSubview(percentLabel)
        animationView.play()
        animationView.loopMode = .loop
        bringSubviewToFront(percentLabel)
        
        animationView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        percentLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ScanRadarView_Preview: PreviewProvider {
    
    static var previews: some View {
        
        ScanRadarView()
            .showPreview()
            .background(Color.black)
    }
}
#endif
