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
        
        switch sender.tag {
            case 10:
            currentOperator = Operator.add
            case 11:
            currentOperator = Operator.subtract
            case 12:
            currentOperator = Operator.multiply
            case 13:
            currentOperator = Operator.divide
            default:
            break
        }
    }
    
    @IBAction func equalsClicked(_ sender: UIButton) {
        calculate()
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
        var result: String = ""
        switch currentOperator {
        case Operator.add:
            result = String(Int(firstValue)! + Int(resultLabel.text!)!)
        case Operator.subtract:
            result = String(Int(firstValue)! - Int(resultLabel.text!)!)
        case Operator.multiply:
            result = String(Int(firstValue)! * Int(resultLabel.text!)!)
        case Operator.divide:
            result = String(Int(firstValue)! / Int(resultLabel.text!)!)
        default:
            break
        }
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }

}

