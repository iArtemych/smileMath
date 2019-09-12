//
//  NumPadView.swift
//  SmileMath
//
//  Created by Artem Chursin on 11/09/2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class NumPadView: UIView {

    //MARK: - Constants
    
    //MARK: - Variables
    
    var oneButton = UIButton(), twoButton = UIButton(), threeButton = UIButton(), minusButton = UIButton(), fourButton = UIButton(), fiveButton = UIButton(), sixButton = UIButton(), pointButton = UIButton(), sevenButton = UIButton(), eightButton = UIButton(), nineButton = UIButton(), zeroButton = UIButton()
//    var buttonsArray: [UIButton] = [oneButton, twoButton]
    
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
    
    lazy var firstStack: UIStackView = {
        
        let stack = UIStackView()
        return createStack(stack: stack)
    }()
    
    lazy var secondStack: UIStackView = {
        
        let stack = UIStackView()
        return createStack(stack: stack)
    }()
    
    lazy var thirdStack: UIStackView = {
        
        let stack = UIStackView()
        return createStack(stack: stack)
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
    }
    
    //MARK: - Actions
    
    //MARK: - Navigation
    
    //MARK: - Private methods
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
    
    private func createStack(stack: UIStackView)-> UIStackView {
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .horizontal
        return stack
    }
}
