//
//  NumPadView.swift
//  SmileMath
//
//  Created by Artem Chursin on 12/09/2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class NumPadView: UIView {

    //MARK: - Constants
    
    //MARK: - Variables
    var answerString: String = ""
    var isMinusSet: Bool = false
    var isPointSet: Bool = false
    
    //MARK: - Outlets
    @IBOutlet var numButtons: [UIButton]!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var pointButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var backspaceButton: UIButton!
    
    //MARK: - LifeStyle ViewController
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for button in numButtons {
            button.backgroundColor = .clear
        }
        
        minusButton.backgroundColor = .clear
        pointButton.backgroundColor = .clear
        
    }
    
    //MARK: - Actions
    @IBAction func backspaceTap(_ sender: Any) {
        
        var updateString: String = ""
        
        if answerString.count > 0 {
            for (index, answerChar) in answerString.enumerated() {
                if index + 1 != answerString.count {
                    updateString = updateString + String(answerChar)
                } else {
                    if answerChar == "," {isPointSet = !isPointSet}
                    if answerChar == "-" {isMinusSet = !isMinusSet}
                }
            }
            answerString = updateString
            answerLabel.text = answerString
        }
    }
    
    @IBAction func oneTap(_ sender: Any) {
        tapToKeyboardButton(symbol: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        tapToKeyboardButton(symbol: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        tapToKeyboardButton(symbol: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        tapToKeyboardButton(symbol: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        tapToKeyboardButton(symbol: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        tapToKeyboardButton(symbol: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        tapToKeyboardButton(symbol: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        tapToKeyboardButton(symbol: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        tapToKeyboardButton(symbol: "9")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        tapToKeyboardButton(symbol: "0")
    }
    
    @IBAction func pointTap(_ sender: Any) {
        
        if !isPointSet {
            if answerString.count < 7 {
                isPointSet = !isPointSet
            }
            tapToKeyboardButton(symbol: ",")
        }
    }
    
    @IBAction func minusTap(_ sender: Any) {
        
        if !isMinusSet {
            if answerString.count < 7 {
                isMinusSet = !isMinusSet
            }
            tapToKeyboardButton(symbol: "-")
        }
    }
    
    //MARK: - Private methods
    private func tapToKeyboardButton(symbol: String) {
        
        if let text = answerLabel.text {
            answerString = text
        }
        
        if answerString.count < 7 {
            answerString = answerString + String(symbol)
            answerLabel.text = answerString
        }
    }
    
    
    
}
