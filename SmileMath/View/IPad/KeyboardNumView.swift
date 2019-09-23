//
//  NumPadView.swift
//  SmileMath
//
//  Created by Artem Chursin on 11/09/2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class KeyboardNumView: UIView {

    //MARK: - Constants
    
    //MARK: - Variables
    private var numPadView: NumPadView!
    
    lazy var blurView: UIVisualEffectView = {
          
        let view = UIVisualEffectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
      
    lazy var vibrancyView: UIVisualEffectView = {
          
        let view = UIVisualEffectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - LifeStyle View
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .clear
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width / 7
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBlureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupBlureView()
        setupKeyboard()
    }
    
    //MARK: - Actions
    
    //MARK: - Navigation
    
    //MARK: - Private methods
    private func setupKeyboard() {
        
        numPadView = NumPadView.loadFromNib()
        vibrancyView.contentView.addSubview(numPadView)
        numPadView.translatesAutoresizingMaskIntoConstraints = false
        
//        numPadView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        numPadView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        numPadView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        numPadView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        if let pad = numPadView {
            let verticalSpaceTop = NSLayoutConstraint(item: pad, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
            let verticalSpaceBottom = NSLayoutConstraint(item: pad, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -5)
            let horisontalSpaceTrailing = NSLayoutConstraint(item: pad, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -20)
            let horisontalSpaceLeading = NSLayoutConstraint(item: pad, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20)
            NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom, horisontalSpaceLeading, horisontalSpaceTrailing])
        }
        
        
    }
    
    private func setupBlureView() {
        let blurEffect: UIBlurEffect
        if #available(iOS 13.0, *) {
            blurEffect = UIBlurEffect(style: .systemMaterial)
        } else {
            blurEffect = UIBlurEffect(style: .extraLight)
        }
        self.addSubview(blurView)

        blurView.effect = blurEffect
        blurView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        setupVibrancyView(blureEffect: blurEffect)
    }
    
    private func setupVibrancyView(blureEffect: UIBlurEffect) {
        
        let vibrancyEffect: UIVibrancyEffect
        if #available(iOS 13.0, *) {
            vibrancyEffect = UIVibrancyEffect(blurEffect: blureEffect, style: .secondaryLabel)
        } else {
            vibrancyEffect = UIVibrancyEffect(blurEffect: blureEffect)
        }
        
        vibrancyView.effect = vibrancyEffect
        
        blurView.contentView.addSubview(vibrancyView)
        
        vibrancyView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        vibrancyView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        vibrancyView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        vibrancyView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
