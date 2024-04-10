//
//  ResultWifiScanViewController.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import SnapKit

class ResultWifiScanViewController: UIViewController {
    
    private let foundDevices: [Device]
    
    private var devicesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .robotoFont(ofSize: 28, weight: .bold)
        label.textColor = .accent
        label.textAlignment = .center
        
        return label
    }()
    
    private let wifiNameLabel: UILabel = {
        let label = UILabel()
        label.text = "WIFI_Name"
        label.font = .robotoFont(ofSize: 15)
        label.textColor = .secondaryText
        label.textAlignment = .center
        return label
    }()
    
    private let devicesLabel: UILabel = {
        let label = UILabel()
        label.text = "Devices"
        label.font = UIFont(name: "Roboto-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [devicesCountLabel, devicesLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 8
        
        return stack
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hStack, wifiNameLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 0
        return stack
    }()
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .secondaryBackground
        containerView.layer.shadowColor = UIColor.accent.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowRadius = 7
        containerView.layer.cornerRadius = 10
        
        return containerView
    }()
    
    var tableView: CustomTableView!
    
//MARK: - Init
    
    init(foundDevices: Array<Device>) {
        
        self.devicesCountLabel.text = String(foundDevices.count)
        self.foundDevices = foundDevices
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otherSetups()
        setupTableView()
        setupViewsAndConstraints()
    }
    
    private func setupTableView() {
        tableView = CustomTableView()
        tableView.backgroundColor = .secondaryBackground
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .secondaryText
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        
        tableView.sectionHeaderTopPadding = 0.0
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        
        tableView.layer.borderWidth = 0.1
        tableView.layer.borderColor = UIColor.accent.cgColor
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        tableView.clipsToBounds = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sizeToFit()
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.register(ResultWifiScanTableViewCell.self, forCellReuseIdentifier: "ResultWifiScanTableViewCell")
    }
    
    private func otherSetups() {
        
        view.backgroundColor = .black
        title = "Result"
    }
    
    private func setupViewsAndConstraints() {
        
        view.addSubview(vStack)
        view.addSubview(containerView)
        view.addSubview(tableView)
        
        vStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(containerView)
            make.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(vStack.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(tableView.snp.height)
        }
    }
}

extension ResultWifiScanViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foundDevices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultWifiScanTableViewCell", for: indexPath) as! ResultWifiScanTableViewCell
        let device = foundDevices[indexPath.row]
        cell.configure(with: device)
        
        return cell
    }
}

extension ResultWifiScanViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let device = foundDevices[indexPath.row]
        let detailVC = DetailWifiScanViewController(device: device)
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ResultWifiScanViewController_Preview: PreviewProvider {
    
    static var previews: some View {
        
        CustomNavigationController(rootViewController: ResultWifiScanViewController(foundDevices: Array(devices.prefix(20))))
            .showPreview()
            .ignoresSafeArea()
    }
}
#endif
