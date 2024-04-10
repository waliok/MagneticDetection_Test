//
//  ButtonCell.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit

class ButtonCell: UICollectionViewCell {
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 3
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsAndConstraints()
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViewsAndConstraints()
    }
    
    private func setupViewsAndConstraints() {
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 23, left: 10, bottom: 23, right: 10))
        }
        
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
    }
    
    func configure(title: String, imageName: String) {
        
        titleLabel.text = title
        titleLabel.sizeToFit()
        iconImageView.image = UIImage(named: imageName)
        
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .primaryBackground
        contentView.layer.masksToBounds = false
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.primaryBackground.cgColor
        layer.shadowColor = UIColor.primaryBackground.cgColor
        layer.shadowOffset = CGSize(width: 8, height: 8)
        layer.shadowRadius = 12
        layer.shadowOpacity = 0.8
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ButtonCell_Preview: PreviewProvider {
    
    static var previews: some View {
        
        CustomNavigationController(rootViewController: MainViewController())
            .showPreview()
            .ignoresSafeArea()
    }
}
#endif

