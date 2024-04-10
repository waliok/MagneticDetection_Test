//
//  WiFiScanManager.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit
import Combine

class FakeWiFiScanManager {
    
    static let shared = FakeWiFiScanManager()
    private var timer: Timer? = nil
    private var isSearching: Bool = false
    private var isScanningStopped = false
    
    let searchingDevicesPublisher = PassthroughSubject<(Int, [Device], Bool), Never>()
    
    private init() {}
    
    func startSearch() {
        guard !isSearching else { return } // Prevent starting multiple searches
        
        isSearching = true
        var progress = 0
        var devicesArray = [Device]()
        var i = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            
            progress += 1  // Increase progress by 1%
            
            if progress % 5 == 0 { // Increase devices count by 1
                i+=1
                devicesArray.append(devices[i])
            }
            
            if progress >= 100 { // Automatically stop scanning when 100% is reached
                stopSearch()
            }
            
            self.searchingDevicesPublisher.send((progress, devicesArray, isScanningStopped))
        }
    }
    
    func stopSearch() {
        self.timer?.invalidate()
        self.timer = nil
        isSearching = false
        isScanningStopped = true
    }
    
    func refreshSearchStatus() {
        isScanningStopped = false
    }
}

