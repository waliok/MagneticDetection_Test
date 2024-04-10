//
//  ScanNetworkViewController.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit
import Lottie
import Combine

class ScanNetworkViewController: UIViewController {
    
    private var cancellables = Set<AnyCancellable>()
    private var devicesArray = [Device]()
    private var isScanningStopped = false
    
    private let stopScanButton = CustomButton()
    private let scanRadarView = ScanRadarView()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Scanning Your Wi-Fi"
        label.font = .robotoFont(ofSize: 15)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TLind_246_lp"
        label.font = .robotoFont(ofSize: 28, weight: .bold)
        label.textColor = .accent
        label.textAlignment = .center
        label.shadowColor = .accent
        
        return label
    }()
    
    private var devicesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .robotoFont(ofSize: 28, weight: .bold)
        label.textColor = .accent
        label.textAlignment = .center
        
        return label
    }()
    
    private let devicesLabel: UILabel = {
        let label = UILabel()
        label.text = "Devices Found..."
        label.font = .robotoFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [devicesCountLabel, devicesLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 8
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otherSetups()
        setupViewsAndConstraints()
        setupWiFiScanPublisher()
        FakeWiFiScanManager.shared.startSearch()
    }
    
    private func otherSetups() {
        
        view.backgroundColor = .black
        stopScanButton.setTitle("Stop", for: .normal)
        stopScanButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
    }
    
    private func setupViewsAndConstraints() {
        
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(scanRadarView)
        view.addSubview(stack)
        view.addSubview(stopScanButton)
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(125)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        scanRadarView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        stack.snp.makeConstraints { make in
            make.bottom.equalTo(stopScanButton.snp.top).offset(-60)
            make.centerX.equalToSuperview()
        }
        
        stopScanButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-70)
            make.height.equalTo(50)
        }
    }
    
    private func setupWiFiScanPublisher() {
        
        FakeWiFiScanManager.shared.searchingDevicesPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] progress, devicesArray, isScanningStopped in
                guard let self = self else { return }
                
                if isScanningStopped {
                    DispatchQueue.main.async {
                        self.scanRadarView.percentLabel.text = "Scan complete!"
                        self.stopScanButton.setTitle("Show results", for: .normal)
                    }
                    
                    let vc = ResultWifiScanViewController(foundDevices: devicesArray)
                    self.navigationController?.pushViewController(vc, animated: true)
                    FakeWiFiScanManager.shared.refreshSearchStatus()
                }
                self.devicesCountLabel.text = "\(devicesArray.count)"
                self.scanRadarView.percentLabel.text = "\(progress)%"
                self.isScanningStopped = isScanningStopped
                self.devicesArray = devicesArray
            }
            .store(in: &cancellables)
    }
    
    @objc private func stopButtonTapped() {
        
        if isScanningStopped {
            let vc = ResultWifiScanViewController(foundDevices: devicesArray)
            navigationController?.pushViewController(vc, animated: true)
            FakeWiFiScanManager.shared.refreshSearchStatus()
        } else if !isScanningStopped  {
            FakeWiFiScanManager.shared.stopSearch()
            isScanningStopped = true
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.scanRadarView.percentLabel.text = "Scan is stopped!"
                self.stopScanButton.setTitle("Show results", for: .normal)
            }
        }
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ScanNetworkViewController_Preview: PreviewProvider {
    
    static var previews: some View {
        
        CustomNavigationController(rootViewController: ScanNetworkViewController())
            .showPreview()
            .ignoresSafeArea()
    }
}
#endif
