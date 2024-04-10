//
//  DetailsViewHeader.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit

class DetailsViewHeader: UIView {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "device"
        label.font = .robotoFont(ofSize: 28, weight: .bold)
        label.textColor = .accent
        label.textAlignment = .center
        label.shadowOffset = .zero
        label.layer.shadowColor = UIColor.accent.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.masksToBounds = false
        
        return label
    }()
    
    let ipLabel: UILabel = {
        let label = UILabel()
        label.text = "ip"
        label.font = .robotoFont(ofSize: 15)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
    }
    
    init(label1: String, label2: String) {
        super.init(frame: .zero)
        
        setLabelsText(label1: label1, label2: label2)
        setupViewsAndConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewsAndConstraints() {
        
        addSubview(nameLabel)
        addSubview(ipLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        ipLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setLabelsText(label1: String, label2: String) {
        nameLabel.text = label1
        ipLabel.text = label2
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct DetailsViewHeader_Preview: PreviewProvider {
    
    static var previews: some View {
        
        DetailsViewHeader(label1: "Phone", label2: "192.168.1.1")
            .showPreview()
            .frame(width: 350, height: 150)
            .padding()
            .background(Color.secondaryBackground)
    }
}
#endif
