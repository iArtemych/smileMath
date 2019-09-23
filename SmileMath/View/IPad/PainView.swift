//
//  PainView.swift
//  SmileMath
//
//  Created by Artem Chursin on 18/09/2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class PainView: UIView {
    
    //MARK: - Constants
    
    //MARK: - Variables
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
    
    lazy var paintImage: UIImageView = {
       
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        return image
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("X", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        if #available(iOS 13.0, *) {
            button.setTitleColor(.systemBackground, for: .normal)
            button.tintColor = .systemBackground
        } else {
            button.setTitleColor(.red, for: .normal)
        }
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Share", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        if #available(iOS 13.0, *) {
            button.setTitleColor(.systemBackground, for: .normal)
            button.tintColor = .systemBackground
        } else {
            button.setTitleColor(.red, for: .normal)
        }
        return button
    }()
    
    lazy var fullScreenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("FullScreen", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        if #available(iOS 13.0, *) {
            button.setTitleColor(.systemBackground, for: .normal)
            button.tintColor = .systemBackground
        } else {
            button.setTitleColor(.red, for: .normal)
        }
        return button
    }()
    
    private var lastPoint = CGPoint.zero
    private var swiped = false
    
    //MARK: - Outlets
    
    //MARK: - LifeStyle ViewController
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .clear
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width / 7
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    //MARK: - Actions
    @objc func pressedReset(sender: UIButton!){
        
        paintImage.image = nil
    }
    
    @objc func pressedFull(sender: UIButton!){
        
        print("Huy")
    }
    
    @objc func pressedShare(sender: UIButton!){
        
//        UIGraphicsBeginImageContext(paintImage.bounds.size)
//        paintImage.image?.draw(in: CGRect(x: 0, y: 0, width: paintImage.frame.size.width, height: paintImage.frame.size.height))
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        let activityImage = [image]
//        let activity = UIActivityViewController(activityItems: activityImage, applicationActivities: nil)
//        activity.popoverPresentationController?.sourceView = self
//        
//        presentViewController(activity, animated: true, completion: nil)
    }
    //MARK: - Navigation
    
    //MARK: - Private methods
    private func setupImage() {
        
        vibrancyView.contentView.addSubview(paintImage)
        
        paintImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        paintImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        paintImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        paintImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
      
      // 1
        UIGraphicsBeginImageContext(self.frame.size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        paintImage.image?.draw(in: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
      
        let startPoint = CGPoint(x: fromPoint.x, y: fromPoint.y)
        let endPoint = CGPoint(x: toPoint.x, y: toPoint.y)
        
        context.move(to: startPoint)
        context.addLine(to: endPoint)
        
        context.setLineCap(CGLineCap.round)
        context.setLineWidth(3.0)
        context.setStrokeColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        context.setBlendMode(CGBlendMode.normal)
        
        context.strokePath()
        
        paintImage.image = UIGraphicsGetImageFromCurrentImageContext()
        paintImage.alpha = 1.0
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !swiped {
            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
        }
        
        UIGraphicsBeginImageContext(paintImage.frame.size)
        paintImage.image?.draw(in: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), blendMode: CGBlendMode.normal, alpha: 1.0)
        paintImage.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    private func setupView() {
        
        setupBlureView()
        setupImage()
        setupResetButton()
        setupShareButton()
        setupFullScreenButton()
    }
    
    private func setupFullScreenButton() {
        
        vibrancyView.contentView.addSubview(fullScreenButton)
        NSLayoutConstraint(item: resetButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10).isActive = true
        fullScreenButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        fullScreenButton.addTarget(self, action: #selector(self.pressedFull(sender:)), for: .touchUpInside)
        
    }
    
    private func setupResetButton() {
        
        vibrancyView.contentView.addSubview(resetButton)
        let verticalSpaceTop = NSLayoutConstraint(item: resetButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10)
        let horisontalSpaceLeading = NSLayoutConstraint(item: resetButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([verticalSpaceTop, horisontalSpaceLeading])
        resetButton.addTarget(self, action: #selector(self.pressedReset(sender:)), for: .touchUpInside)
    }
    
    private func setupShareButton() {
        
        vibrancyView.contentView.addSubview(shareButton)
        let verticalSpaceTop = NSLayoutConstraint(item: shareButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10)
        let horisontalSpaceTrailing = NSLayoutConstraint(item: shareButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -40)
        NSLayoutConstraint.activate([verticalSpaceTop, horisontalSpaceTrailing])
        resetButton.addTarget(self, action: #selector(self.pressedShare(sender:)), for: .touchUpInside)
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
