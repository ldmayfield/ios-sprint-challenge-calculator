//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

var brain: CalculatorBrain? //*1 is this already done?
var oldValue: String?

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain() //*2 initialize new CalculatorBrain object
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        //*3 extract text property from button with if let
        //* call addOperand Digit on brain(optional?)
        // pass in digit string using outputLabel
        
        if let noTapped = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(noTapped)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if oldValue != nil {
            brain?.operand1String = oldValue!
            oldValue = nil
        }
        
        if (sender.titleLabel?.text) != nil {
            if let operandText1 = outputLabel.text {
                brain?.operand1String = operandText1
            }
            brain?.setOperator((sender.titleLabel?.text ?? nil)!)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        // call calculate if possible on brain object
        if let equalValue = brain?.calculateIfPossible() {
            outputLabel.text = equalValue
            brain = CalculatorBrain()
            if outputLabel.text == "0" {
                oldValue = equalValue
            } else {
                oldValue = nil
            }
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        // call clearTransaction Method to initialize new calculation
        // reset outputLabel.text to blank
        clearTransaction()
        outputLabel.text = " "
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
