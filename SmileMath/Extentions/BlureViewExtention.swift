//
//  BlureViewExtention.swift
//  SmileMath
//
//  Created by Artem Chursin on 23/09/2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
//    func setupBlure() -> (UIVisualEffectView, UIBlurEffect) {
//        let blurView = UIVisualEffectView()
//        blurView.translatesAutoresizingMaskIntoConstraints = false
//        
//        let blurEffect: UIBlurEffect
//        if #available(iOS 13.0, *) {
//            blurEffect = UIBlurEffect(style: .systemMaterial)
//        } else {
//            blurEffect = UIBlurEffect(style: .extraLight)
//        }
//        self.addSubview(blurView)
//
//        blurView.effect = blurEffect
//        blurView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        
//        return (blurView, blurEffect)
//    }
//    
//    func setupVibrancy(blureEffect: UIBlurEffect, blurView: UIVisualEffectView) -> UIVisualEffectView {
//        let vibrancyView = UIVisualEffectView()
//        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
//        
//        let vibrancyEffect: UIVibrancyEffect
//        if #available(iOS 13.0, *) {
//            vibrancyEffect = UIVibrancyEffect(blurEffect: blureEffect, style: .secondaryLabel)
//        } else {
//            vibrancyEffect = UIVibrancyEffect(blurEffect: blureEffect)
//        }
//        
//        vibrancyView.effect = vibrancyEffect
//        
//        blurView.contentView.addSubview(vibrancyView)
//        
//        vibrancyView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        vibrancyView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        vibrancyView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        vibrancyView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        
//        return vibrancyView
//    }
}
