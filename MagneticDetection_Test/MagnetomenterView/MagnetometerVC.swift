//
//  MagnetometerVC.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit

class MagnetometerVC: UIViewController {
    
    let fakeMagnetometerDataManager = FakeMagnetometerDataManager()
    private var scanIsOn = false
    private let gaugeView = GaugeView()
    private let scanButton = CustomButton()
    private let backgroundImage = UIImageView(image: .secondaryBackground)
    private let wifiGroupView = UIImageView(image: .magnetGroup)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        otherSetups()
        setupViewsAndConstraints()
    }
    
    private func otherSetups() {
        
        fakeMagnetometerDataManager.delegate = self
        self.title = "Magnetic Detection"
        view.backgroundColor = .black
        backgroundImage.contentMode = .scaleAspectFill
        wifiGroupView.contentMode = .scaleAspectFit
        scanButton.setTitle("Search", for: .normal)
        scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
    }
    
    private func setupViewsAndConstraints() {
        
        view.addSubview(scanButton)
        view.addSubview(gaugeView)
        view.addSubview(wifiGroupView)
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        backgroundImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(330)
        }
        
        wifiGroupView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(33)
            make.trailing.equalToSuperview().offset(-33)
            make.height.equalTo(190)
        }
        
        scanButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-70)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        gaugeView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.width.equalTo(300)
            make.size.height.equalTo(300)
        }
    }
    
    @objc func scanButtonTapped() {
        
        if scanIsOn {
            fakeMagnetometerDataManager.stopGeneratingData()
            scanIsOn.toggle()
            scanButton.setTitle("Search", for: .normal)
            gaugeView.valueLabel.text = "Search checking"
        } else if !scanIsOn{
            fakeMagnetometerDataManager.startGeneratingData()
            scanIsOn.toggle()
            scanButton.setTitle("Stop", for: .normal)
        }
    }
}

extension MagnetometerVC: MagnetometerDataManagerDelegate {
    
    func didReceiveMagnetometerData(value: Int) {
        UIView.animate(withDuration: 0.5) {
            self.gaugeView.value = value
        }
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MagnetometerVC_Preview: PreviewProvider {
    
    static var previews: some View {
        
        CustomNavigationController(rootViewController: MagnetometerVC())
            .showPreview()
            .ignoresSafeArea()
    }
}
#endif
