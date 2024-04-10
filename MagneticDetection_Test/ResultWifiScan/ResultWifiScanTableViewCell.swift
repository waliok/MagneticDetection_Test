//
//  ResultWifiScanTableViewCell.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit

class ResultWifiScanTableViewCell: UITableViewCell {
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoFont(ofSize: 13, weight: .medium)
        label.textColor = .secondaryText
        label.textAlignment = .left
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "wifiIcon")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with device: Device) {
        // Create a background view to contol background color and selection
        let backgroundView = UIView()
        backgroundView.backgroundColor = .accent.withAlphaComponent(0.7)
        // Configure the cell
        selectedBackgroundView = backgroundView
        backgroundColor = .clear
        tintColor = .white
        layoutMargins = UIEdgeInsets.zero
        accessoryView = UIImageView(image: UIImage(systemName: "chevron.right"))
        
        if device.isWarning {
            iconImageView.image = UIImage(named: "wifiIconWarning")
        } else {
            iconImageView.image = UIImage(named: "wifiIcon")
        }
        
        primaryLabel.text = device.name
        secondaryLabel.text = device.ipAddress
        
        setupViewsAndConstraints()
    }
    
    func setupViewsAndConstraints() {
        
        contentView.addSubview(primaryLabel)
        contentView.addSubview(secondaryLabel)
        contentView.addSubview(iconImageView)
        
        primaryLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(secondaryLabel.snp.top)
            make.leading.equalTo(iconImageView.snp.trailing).offset(5)
            make.trailing.equalTo(contentView.snp.trailing).offset(-5)
        }
        
        secondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(primaryLabel.snp.bottom)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
            make.leading.equalTo(iconImageView.snp.trailing).offset(5)
            make.trailing.equalTo(contentView.snp.trailing).offset(-5)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.width.equalTo(iconImageView.snp.height)
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ResultWifiScanTableViewCell_Preview: PreviewProvider {
    
    static var previews: some View {
        let cell = ResultWifiScanTableViewCell()
        
        cell
            .showPreview()
            .onAppear {
                cell.configure(with: devices.first!)
            }
            .frame(width: 350, height: 60)
            .background(Color.secondaryBackground)
    }
}
#endif
