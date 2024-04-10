//
//  MiddleView.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit

class MiddleView: UIView {
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Wi-Fi"
        label.font = .robotoFont(ofSize: 15, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "WIFI_Name"
        let fontSize: CGFloat = isBigResolution() ? 34 : 25
        label.font = .robotoFont(ofSize: fontSize, weight: .bold)
        label.textColor = .accent
        label.shadowOffset = .zero
        label.layer.shadowColor = UIColor.accent.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.masksToBounds = false
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ready to Scan this network"
        label.font = .robotoFont(ofSize: 17)
        label.textColor = .secondaryText
        label.textAlignment = .center
        
        return label
    }()
    
    let scanButton = CustomButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewsAndConstraints()
    }
    
    private func setupViewsAndConstraints() {
        
        backgroundColor = .secondaryBackground
        layer.cornerRadius = 8
        
        scanButton.setTitle("Scan Network", for: .normal)
        
        addSubview(topLabel)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(scanButton)
        
        topLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topLabel.snp.bottom).offset(8)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        
        scanButton.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MiddleView_Preview: PreviewProvider {
    
    static var previews: some View {
        
        MiddleView()
            .showPreview()
            .frame(width: 350, height: 200)
    }
}
#endif
