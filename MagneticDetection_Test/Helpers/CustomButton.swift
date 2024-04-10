//
//  CustomButton.swift
//  MagneticDetection_Test
//
//  Created by Waliok on 02/04/2024.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit() {
            
            setTitleColor(.white, for: .normal)
            backgroundColor = .accent
            titleLabel?.font = .robotoFont(ofSize: 20, weight: .bold)
            layer.cornerRadius = 25
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            // Scale down animation when touch begins
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesEnded(touches, with: event)
            // Scale back to original size when touch ends
            UIView.animate(withDuration: 0.1) {
                self.transform = .identity
            }
            // Call action targets if the touch ends inside the button
//            if let touch = touches.first, self.bounds.contains(touch.location(in: self)) {
//                sendActions(for: .touchUpInside)
//            }
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesCancelled(touches, with: event)
            // Scale back to original size if touch is cancelled
            UIView.animate(withDuration: 0.1) {
                self.transform = .identity
            }
        }
}
