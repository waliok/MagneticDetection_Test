//
//  MainViewController.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UICollectionViewDataSource {
    
    private let features = [
        Feature(title: .infrared, imageName: "webCam"),
        Feature(title: .bluetooth, imageName: "bluetooth"),
        Feature(title: .magnetic, imageName: "magnet"),
        Feature(title: .antispy, imageName: "bulb")
    ]
    
    private let backgroundImage = UIImageView(image: .primaryBackground)
    private let wifiGroupView: UIImageView = UIImageView(image: .wifiGroup)
    private let middleView = MiddleView()
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        otherSetups()
        setupCollectionView()
        setupViewsAndConstraints()
    }
    
    private func otherSetups() {
        
        self.title = "Main"
        view.backgroundColor = .black
        
        backgroundImage.contentMode = .scaleAspectFill
        wifiGroupView.contentMode = .scaleAspectFit
        
        middleView.scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
        
        let sfSymbolImage = UIImage(systemName: "slider.vertical.3")
        let barButtonItem = UIBarButtonItem(image: sfSymbolImage, style: .plain, target: self, action: #selector(navigationBarButtonTapped))
        barButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    private func setupViewsAndConstraints() {
        
        view.addSubview(wifiGroupView)
        view.addSubview(middleView)
        view.addSubview(collectionView)
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        backgroundImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(330)
        }
        
        wifiGroupView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(33)
            make.trailing.equalToSuperview().offset(-33)
            make.bottom.equalTo(middleView.snp.top).offset(-15)
            make.height.equalTo(isBigResolution() ? 200 : 130)
        }
        
        middleView.snp.makeConstraints { make in
            make.top.equalTo(wifiGroupView.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(collectionView.snp.top)
            make.height.equalTo(isBigResolution() ? 200 : 170 )
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(middleView.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        let itemSize = isBigResolution() ? 140 : 120
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        let spacing: CGFloat = isBigResolution() ? 35 : 15
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        let totalCellWidth = layout.itemSize.width * 2
        let totalSpacingWidth = spacing * (2 - 1)
        
        let leftInset = (view.frame.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: leftInset, bottom: spacing, right: rightInset)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: "FeatureCell")
        collectionView.backgroundColor = UIColor.clear
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCell", for: indexPath) as! ButtonCell
        let feature = features[indexPath.item]
        cell.configure(title: feature.title.rawValue, imageName: feature.imageName)
        
        return cell
    }
    
    @objc func navigationBarButtonTapped() {
           print("NavigationBarButton button tapped")
       }
    
    @objc func scanButtonTapped() {
        
        let scanNetworkVC = ScanNetworkViewController()
        self.navigationController?.pushViewController(scanNetworkVC, animated: true)
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.alpha = 0.5 // Dim the cell to indicate selection
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.alpha = 1.0 // Restore the cell to full opacity
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let feature = features[indexPath.item]
        
        switch feature.title {
        case .infrared:
            performInfraredDetection()
            
        case .bluetooth:
            performBluetoothDetection()
            
        case .magnetic:
            performMagneticDetection()
            
        case .antispy:
            showAntispyTips()
        }
    }
    
    func performInfraredDetection() {
    }
    
    func performBluetoothDetection() {
    }
    
    func performMagneticDetection() {
        let magnetometerVC = MagnetometerVC()
        
        self.navigationController?.pushViewController(magnetometerVC, animated: true)
    }
    
    func showAntispyTips() {
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MainViewController_Preview: PreviewProvider {
    
    static var previews: some View {
        
        CustomNavigationController(rootViewController: MainViewController())
            .showPreview()
            .ignoresSafeArea()
    }
}
#endif
