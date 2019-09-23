//
//  TaskView.swift
//  SmileMath
//
//  Created by Artem Chursin on 09/09/2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class TaskView: UIView {
    
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
    
    lazy var vibrancyLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Задание 1. Простейшие задачи"
        if #available(iOS 13.0, *) {
            label.textColor = .systemBackground
        } else {
            label.textColor = .white
        }
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .medium)
        return label
    }()
    
    lazy var vibrancyTaskText: UITextView = {
        let textView = UITextView()
       
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Dfkldgjklfdjgkjfdlgjsfjgk;sjgkjsfkdjgkjgldkfjgkfjlkfdjglkfjgkjflkgjklfjgkljfklgjklfjgklfjgkljfklgjdfkljgklfjgkljfklgjfkjglkfdjglkfdjglkfdjglkfjglkfdgjkfgjlfdjgDfkldgjklfdjgkjfdlgjsfjgk;sjgkjsfkdjgkjgldkfjgkfjlkfdjglkfjgkjflkgjklfjgkljfklgjklfjgklfjgkljfklgjdfkljgklfjgkljfklgjfkjglkfdjglkfdjglkfdjglkfjglkfdgjkfgjlfdjgDfkldgjklfdjgkjfdlgjsfjgk;sjgkjsfkdjgkjgldkfjgkfjlkfdjglkfjgkjflkgjklfjgkljfklgjklfjgklfjgkljfklgjdfkljgklfjgkljfklgjfkjglkfdjglkfdjglkfdjglkfjglkfdgjkfgjlfdjgDfkldgjklfdjgkjfdlgjsfjgk;sjgkjsfkdjgkjgldkfjgkfjlkfdjglkfjgkjflkgjklfjgkljfklgjklfjgklfjgkljfklgjdfkljgklfjgkljfklgjfkjglkfdjglkfdjglkfdjglkfjglkfdgjkfgjlfdjgDfkldgjklfdjgkjfdlgjsfjgk;sjgkjsfkdjgkjgldkfjgkfjlkfdjglkfjgkjflkgjklfjgkljfklgjklfjgklfjgkljfklgjdfkljgklfjgkljfklgjfkjglkfdjglkfdjglkfdjglkfjglkfdgjkfgjlfdjg"
        textView.isEditable = false
        textView.backgroundColor = .clear
        if #available(iOS 13.0, *) {
            textView.tintColor = .systemBackground
        } else {
            textView.tintColor = .white
        }
        textView.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return textView
    }()
    
    lazy var vibrancyBackButton: UIButton = UIButton()
    lazy var vibrancyNextButton: UIButton = UIButton()
    lazy var vibrancyToDoButton: UIButton = UIButton()
    lazy var vibrancyCheckRedyButton: UIButton = UIButton()
    lazy var vibrancyFullScreenButton: UIButton = UIButton()
    
    //MARK: - LifeStyle View
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
    @objc func pressedBack(sender: UIButton!) {
        print("fuuuck")
    }
    
    @objc func pressedNext(sender: UIButton!){
        print("fuuuckNext")
    }
    
    @objc func pressedToDo(sender: UIButton!){
        print("pressedToDo")
    }
    
    @objc func pressedReady(sender: UIButton!){
        print("pressedReady")
    }
    
    @objc func pressedFullScreen(sender: UIButton!){
        print("pressedFullScreen")
    }
    
    //MARK: - Navigation
    
    //MARK: - Private methods
    private func setupView() {
        setupBlureView()
        configTaskLable()
        setupTaskText()
        setupBackButton()
        setupNextButton()
        setupToDoButton()
        setupReadyButton()
        setupFullScreenButton()
    }
    
    private func configTaskLable() {
        vibrancyView.contentView.addSubview(vibrancyLabel)
        
        let verticalSpaceTop = NSLayoutConstraint(item: vibrancyLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20)
        let horisontalSpaceTrailing = NSLayoutConstraint(item: vibrancyLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -25)
        let horisontalSpaceLeading = NSLayoutConstraint(item: vibrancyLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 25)
        NSLayoutConstraint.activate([verticalSpaceTop, horisontalSpaceLeading, horisontalSpaceTrailing])
    }
    
    private func setupTaskText() {
        vibrancyView.contentView.addSubview(vibrancyTaskText)

        let verticalSpaceTop = NSLayoutConstraint(item: vibrancyTaskText, attribute: .top, relatedBy: .equal, toItem: vibrancyLabel, attribute: .bottom, multiplier: 1, constant: 5)
        let verticalSpaceBottom = NSLayoutConstraint(item: vibrancyTaskText, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -55)
        let horisontalSpaceTrailing = NSLayoutConstraint(item: vibrancyTaskText, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -20)
        let horisontalSpaceLeading = NSLayoutConstraint(item: vibrancyTaskText, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20)
        NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom, horisontalSpaceLeading, horisontalSpaceTrailing])
        
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
    
    private func setupTaskBarButton(button: UIButton, name: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle(name, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        if #available(iOS 13.0, *) {
            button.setTitleColor(.systemBackground, for: .normal)
            button.tintColor = .systemBackground
        } else {
            button.setTitleColor(.red, for: .normal)
        }
    }
    
    private func setupBackButton(){
        setupTaskBarButton(button: vibrancyBackButton, name: "<")
        vibrancyView.contentView.addSubview(vibrancyBackButton)
        
        
        let verticalSpaceTop = NSLayoutConstraint(item: vibrancyBackButton, attribute: .top, relatedBy: .equal, toItem: vibrancyTaskText, attribute: .bottom, multiplier: 1, constant: 5)
        let verticalSpaceBottom = NSLayoutConstraint(item: vibrancyBackButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -15)
        let horisontalSpaceLeading = NSLayoutConstraint(item: vibrancyBackButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom, horisontalSpaceLeading])
        vibrancyBackButton.addTarget(self, action: #selector(self.pressedBack(sender:)), for: .touchUpInside)
    }
    
    private func setupNextButton(){
        setupTaskBarButton(button: vibrancyNextButton, name: ">")
        vibrancyView.contentView.addSubview(vibrancyNextButton)
        
        
        let verticalSpaceTop = NSLayoutConstraint(item: vibrancyNextButton, attribute: .top, relatedBy: .equal, toItem: vibrancyTaskText, attribute: .bottom, multiplier: 1, constant: 5)
        let verticalSpaceBottom = NSLayoutConstraint(item: vibrancyNextButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -15)
        let horisontalSpaceTrailing = NSLayoutConstraint(item: vibrancyNextButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -40)
        NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom, horisontalSpaceTrailing])
        vibrancyNextButton.addTarget(self, action: #selector(self.pressedNext(sender:)), for: .touchUpInside)
    }
    
    private func setupToDoButton(){
        setupTaskBarButton(button: vibrancyToDoButton, name: "?")
        vibrancyView.contentView.addSubview(vibrancyToDoButton)
        
        let verticalSpaceTop = NSLayoutConstraint(item: vibrancyToDoButton, attribute: .top, relatedBy: .equal, toItem: vibrancyTaskText, attribute: .bottom, multiplier: 1, constant: 5)
        let verticalSpaceBottom = NSLayoutConstraint(item: vibrancyToDoButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -15)
        let horisontalSpaceLeading = NSLayoutConstraint(item: vibrancyToDoButton, attribute: .leading, relatedBy: .equal, toItem: self.vibrancyBackButton, attribute: .trailing, multiplier: 1, constant: 10)
        NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom, horisontalSpaceLeading])
        vibrancyToDoButton.addTarget(self, action: #selector(self.pressedToDo(sender:)), for: .touchUpInside)
    }
    
    private func setupReadyButton(){
        setupTaskBarButton(button: vibrancyCheckRedyButton, name: "*_*")
        vibrancyView.contentView.addSubview(vibrancyCheckRedyButton)
        
        let verticalSpaceTop = NSLayoutConstraint(item: vibrancyCheckRedyButton, attribute: .top, relatedBy: .equal, toItem: vibrancyTaskText, attribute: .bottom, multiplier: 1, constant: 5)
        let verticalSpaceBottom = NSLayoutConstraint(item: vibrancyCheckRedyButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -15)
        let horisontalSpaceTrailing = NSLayoutConstraint(item: vibrancyCheckRedyButton, attribute: .trailing, relatedBy: .equal, toItem: self.vibrancyNextButton, attribute: .leading, multiplier: 1, constant: -10)
        NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom, horisontalSpaceTrailing])
        vibrancyCheckRedyButton.addTarget(self, action: #selector(self.pressedReady(sender:)), for: .touchUpInside)
    }
    
    private func setupFullScreenButton(){
        setupTaskBarButton(button: vibrancyFullScreenButton, name: "F")
        vibrancyView.contentView.addSubview(vibrancyFullScreenButton)
        
        let verticalSpaceTop = NSLayoutConstraint(item: vibrancyFullScreenButton, attribute: .top, relatedBy: .equal, toItem: vibrancyTaskText, attribute: .bottom, multiplier: 1, constant: 5)
        let verticalSpaceBottom = NSLayoutConstraint(item: vibrancyFullScreenButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -15)
        vibrancyFullScreenButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom])
        vibrancyFullScreenButton.addTarget(self, action: #selector(self.pressedFullScreen(sender:)), for: .touchUpInside)
    }
    
}
