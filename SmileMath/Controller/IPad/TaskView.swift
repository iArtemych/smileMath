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
        configTaskLable()
        setupTaskText()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupBlureView()
        configTaskLable()
        setupTaskText()
        
    }
    
    //MARK: - Actions
    
    //MARK: - Navigation
    
    //MARK: - Private methods
    private func configTaskLable() {
        vibrancyView.contentView.addSubview(vibrancyLabel)
        
        let verticalSpaceTop = NSLayoutConstraint(item: vibrancyLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20)
        let horisontalSpaceTrailing = NSLayoutConstraint(item: vibrancyLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -25)
        let horisontalSpaceLeading = NSLayoutConstraint(item: vibrancyLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 25)
        NSLayoutConstraint.activate([verticalSpaceTop, horisontalSpaceLeading, horisontalSpaceTrailing])
    }
    
    private func setupTaskText() {
        vibrancyView.contentView.addSubview(vibrancyTaskText)

        let verticalSpaceTop = NSLayoutConstraint(item: vibrancyTaskText, attribute: .top, relatedBy: .equal, toItem: vibrancyLabel, attribute: .bottom, multiplier: 1, constant: 10)
        let verticalSpaceBottom = NSLayoutConstraint(item: vibrancyTaskText, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -50)
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
    
}
