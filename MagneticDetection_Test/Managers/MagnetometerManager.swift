//
//  MagnetometerManager.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import Foundation

protocol MagnetometerDataManagerDelegate: AnyObject {
    
    func didReceiveMagnetometerData(value: Int)
}

class FakeMagnetometerDataManager {
    
    weak var delegate: MagnetometerDataManagerDelegate?
    private var generationTimer: Timer?
    private var dataTimer: Timer?
    private var isGeneratingData = false
    private let ranges: [[Int]] = [[33, 38], [66, 70], [50, 54]] // Define ranges
    private var currentRangeIndex = 0 // Index of current range
    
    func startGeneratingData() {
        guard !isGeneratingData else { return }
        isGeneratingData = true
        generateDataInRange(range: ranges[currentRangeIndex]) // Start emit values before main timer emit first value after 3 seconds
        generationTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in // Start the main timer which continuously emit values inside current range of values
            let currentRange = self.ranges[self.currentRangeIndex]
            self.generateDataInRange(range: currentRange)
            self.moveToNextRange()
        }
    }
    
    func stopGeneratingData() {
        
        dataTimer?.invalidate()
        generationTimer?.invalidate()
        dataTimer = nil
        generationTimer = nil
        
        isGeneratingData = false
        delegate?.didReceiveMagnetometerData(value: 0)
    }
    
    private func generateDataInRange(range: [Int]) {
        dataTimer?.invalidate()
        dataTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            let value = Int.random(in: range[0]...range[1])
            self.delegate?.didReceiveMagnetometerData(value: value)
        }
    }
    
    private func moveToNextRange() {
        currentRangeIndex += 1
        if currentRangeIndex >= ranges.count {
            currentRangeIndex = 0 // Wrap around to the first range
        }
    }
}
