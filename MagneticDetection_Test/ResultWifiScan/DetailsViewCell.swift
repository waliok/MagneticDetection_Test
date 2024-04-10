//
//  DetailsViewCell.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit

class DetailsViewCell: UITableViewCell {
    
    let primaryLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoFont(ofSize: 17)
        label.textColor = .secondaryText
        label.textAlignment = .right
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(key: String, value: String) {
        
        primaryLabel.text = key
        secondaryLabel.text = value
        
        backgroundColor = .clear
        layoutMargins = UIEdgeInsets.zero
        setupViewsAndConstraints()
    }
    
    func setupViewsAndConstraints() {
        
        contentView.addSubview(primaryLabel)
        contentView.addSubview(secondaryLabel)
        
        primaryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.trailing.equalTo(secondaryLabel)
            make.leading.equalToSuperview().offset(15)
        }
        
        secondaryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.leading.equalTo(primaryLabel)
            make.trailing.equalToSuperview().offset(-15)
        }
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct DetailsViewCell_Preview: PreviewProvider {
    
    static var previews: some View {
        let cell = DetailsViewCell()
        
        cell
            .showPreview()
            .onAppear {
                cell.configure(key: "Connection Type", value: "WiFi")
            }
            .frame(width: 350, height: 60)
            .background(Color.secondaryBackground)
    }
}
#endif
