//
//  ViewController.swift
//  Calculator
//
//  Created by Александр Слатинин on 26/01/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberClicked(_ sender: UIButton) {
        if (sender.tag > 9 || sender.tag < 0) {
            return
        }
        resultLabel.text = String(sender.tag)
    }
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        switch sender.tag {
            case 10:
            resultLabel.text = "10"
            case 11:
            resultLabel.text = "11"
            case 12:
            resultLabel.text = "12"
            case 13:
            resultLabel.text = "13"
            default:
            break
        }
    }
    
    @IBAction func equalsClicked(_ sender: UIButton) {
        
    }

}

