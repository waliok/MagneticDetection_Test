//
//  DevicesData.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit

enum ConnectionType: String {
    case wifi = "WiFi"
}

struct Device {
    
    let name: String
    let ipAddress: String
    let macAddress: String
    let hostName: String
    let isWarning: Bool
    let connectionType: ConnectionType
}

let devices = [
    Device(name: "MacTick-a123", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: true, connectionType: .wifi),
    Device(name: "-", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Phone", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: true, connectionType: .wifi),
    Device(name: "Ms_12k", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: true, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "MacTick-a123", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: true, connectionType: .wifi),
    Device(name: "-", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Phone", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: true, connectionType: .wifi),
    Device(name: "Ms_12k", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: true, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "MacTick-a123", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: true, connectionType: .wifi),
    Device(name: "-", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Phone", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: true, connectionType: .wifi),
    Device(name: "Ms_12k", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: true, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi),
    Device(name: "Router Traplun", ipAddress: "192.168.1.1", macAddress: "00:00:00:00:00:00", hostName: "gwpc-21141234.local", isWarning: false, connectionType: .wifi)
   ]
