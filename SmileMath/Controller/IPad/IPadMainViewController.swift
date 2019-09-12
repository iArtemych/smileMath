//
//  IPadMainViewController.swift
//  SmileMath
//
//  Created by Артем Чурсин on 05/09/2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class IPadMainViewController: UIViewController {

    //MARK: - Constants
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    //MARK: - Variables
    
    //MARK: - Outlets
    @IBOutlet weak var taskAndPadStack: UIStackView!
    @IBOutlet weak var taskView: TaskView!
    
    //MARK: - LifeStyle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBlureView()
        setupBackground()
//        taskView.configTaskView()
    
    }
    
    //MARK: - Actions
    
    //MARK: - Navigation
    
    //MARK: - Private methods
    
    
    private func setupBackground() {
        
        //TODO: - change to systemBlack
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
            backgroundImageView.tintColor = .systemBlue
        } else {
            view.backgroundColor = .black
        }
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupBlureView() {
        let blurEffect: UIBlurEffect
        if #available(iOS 13.0, *) {
            blurEffect = UIBlurEffect(style: .systemMaterial)
        } else {
            blurEffect = UIBlurEffect(style: .extraLight)
        }
        view.addSubview(blurView)
        view.sendSubviewToBack(blurView)
        blurView.effect = blurEffect
        blurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
