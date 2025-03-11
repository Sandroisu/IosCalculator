//
//  ViewController.swift
//  Calculator
//
//  Created by Александр Слатинин on 26/01/2025.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperator: Operator = Operator.nothing
    var calcState: CalculationState = CalculationState.enteringNumber
    
    var firstValue: String = ""

    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberClicked(_ sender: UIButton) {
        if (sender.tag > 9 || sender.tag < 0) {
            return
        }
        updateDisplay(number: String(sender.tag))
    }
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text {
            if !num.isEmpty {
                firstValue = num
                resultLabel.text = ""
            }
        }
        updateOperatorButton(tag: sender.tag)
        switch sender.tag {
            case 10:
            currentOperator = Operator.add
            operatorLabel.text = firstValue + "+"
            case 11:
            currentOperator = Operator.subtract
            operatorLabel.text = firstValue + "-"
            case 12:
            currentOperator = Operator.multiply
            operatorLabel.text = firstValue + "*"
            case 13:
            currentOperator = Operator.divide
            operatorLabel.text = firstValue + "/"
            default:
            break
        }
    }
    
    @IBAction func equalsClicked(_ sender: UIButton) {
        calculate()
    }
    
    private func updateOperatorButton(tag: Int) {
        for i in 10..<14 {
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clear
            }
        }
        
        if let button = self.view.viewWithTag(tag) as? UIButton {
            button.backgroundColor = UIColor.yellow
        }
    }
                      
    private func updateDisplay(number: String) {
        if (calcState == CalculationState.newNumStarted) {
            if let num = resultLabel.text {
                if !num.isEmpty {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNumber
                resultLabel.text = number
        } else if (calcState == CalculationState.enteringNumber) {
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    private func calculate() {
        operatorLabel.text = ""
        var result: String = ""
        for i in 10..<14 {
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clear
            }
        }
        switch currentOperator {
        case Operator.add:
            result = String(Double(firstValue)! + Double(resultLabel.text!)!)
        case Operator.subtract:
            result = String(Double(firstValue)! - Double(resultLabel.text!)!)
        case Operator.multiply:
            result = String(Double(firstValue)! * Double(resultLabel.text!)!)
        case Operator.divide:
            result = String(Double(firstValue)! / Double(resultLabel.text!)!)
        default:
            break
        }
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }

}

