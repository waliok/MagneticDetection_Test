//
//  CustomNavigationController.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            delegate = self
        }
    
    private func commonInit() {
        applyDefaultSetting()
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
           // Check if the view controller about to be shown has the title "Main"
           if viewController.title == "Main" {
               applyRootViewControllerSettings()
           }
       }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        // Check if the pushed view controller has not the title "Main"
        if viewController.title != "Main" {
            applyDefaultSetting()
        }
    }
    
    private func applyRootViewControllerSettings() {
            // Apply specific settings to the root view controller
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        navigationBarAppearance.backgroundColor = .clear
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.clear,
            .font: UIFont.robotoFont(ofSize: 17, weight: .bold) as Any
        ]
        
        navigationBar.standardAppearance = navigationBarAppearance
        navigationBar.compactAppearance = navigationBarAppearance
        navigationBar.scrollEdgeAppearance = navigationBarAppearance
        }
    
    private func applyDefaultSetting() {
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        navigationBarAppearance.backgroundColor = .clear
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.robotoFont(ofSize: 17, weight: .bold) as Any
        ]
        
        navigationBar.standardAppearance = navigationBarAppearance
        navigationBar.compactAppearance = navigationBarAppearance
        navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
}

