//
//  DetailWifiScanViewController.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit

class DetailWifiScanViewController: UIViewController {
    
    let device: Device
    
    private lazy var tableView: CustomTableView = {
        let tableView = CustomTableView()
        
        tableView.backgroundColor = .secondaryBackground
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .secondaryText
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        
        tableView.layer.cornerRadius = 10
        tableView.layer.shadowColor = UIColor.accent.cgColor
        tableView.layer.shadowRadius = 10
        tableView.layer.shadowOpacity = 0.35
        tableView.layer.shadowOffset = CGSize(width: 0, height: 3)
        tableView.layer.masksToBounds = false
        tableView.clipsToBounds = false
        
        tableView.sectionHeaderTopPadding = 0.0
        tableView.tableHeaderView = header
        tableView.estimatedSectionHeaderHeight = 1
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.register(DetailsViewCell.self, forCellReuseIdentifier: "DetailViewCell")
        return tableView
    }()
    private var header = DetailsViewHeader(label1: "Phone", label2: "192.168.1.1")
    private let backgroundImage = UIImageView(image: .primaryBackground)
    private let statusImageView = UIImageView()
    
    init(device: Device) {
        self.device = device
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otherSetups()
        setupTableViewHeader(name: device.name, ipAddress: device.ipAddress)
        setupTableView()
        setupViewsAndConstraints()
    }
    
    private func otherSetups() {
        
        title = "Device Details"
        view.backgroundColor = .black
        
        statusImageView.contentMode = .scaleAspectFit
        backgroundImage.contentMode = .scaleAspectFit
        if device.isWarning {
            statusImageView.image = .wifiIconWarningMark
        } else {
            statusImageView.image = .wifiCheckMark
        }
    }
    
    private func setupViewsAndConstraints() {
        
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        view.addSubview(statusImageView)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(statusImageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(330)
        }
        
        statusImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupTableViewHeader(name: String, ipAddress: String) {
        
        if device.isWarning {
            header.nameLabel.textColor = .isWarning
            header.nameLabel.layer.shadowColor = UIColor.isWarning.cgColor
        }
        
        header.nameLabel.text = name
        header.ipLabel.text = ipAddress
        // Set frame size before populate view to have initial size
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        // Recalculate header size after populated with content
        size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        tableView.reloadData()
        tableView.layoutIfNeeded()
    }
    
    private func setupTableView() {
        tableView.sizeToFit()
        tableView.reloadData()
        tableView.layoutIfNeeded()
    }
}

extension DetailWifiScanViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell", for: indexPath) as! DetailsViewCell
        
        switch indexPath.row {
        case 0:
            cell.configure(key: "Connection Type", value: device.connectionType.rawValue)
        case 1:
            cell.configure(key: "IP Address", value: device.ipAddress)
        case 2:
            cell.configure(key: "MAC Address", value: device.macAddress)
        case 3: cell.configure(key: "Hostname", value: device.hostName)
        default:
            break
        }
        
        return cell
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct DetailWifiScanViewController_Preview: PreviewProvider {
    
    static var previews: some View {
        
        CustomNavigationController(rootViewController: DetailWifiScanViewController(device: devices.first!))
            .showPreview()
            .ignoresSafeArea()
    }
}
#endif
