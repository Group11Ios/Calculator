//
//  ViewController.swift
//  Calculator
//
//  Created by Hoang on 4/20/18.
//  Copyright © 2018 Hoangr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var mathOperation = false
    var operation = 0
    
    @IBOutlet weak var showpheptinh: UILabel!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 1...19{
            view.viewWithTag(i)?.layer.borderWidth = 1.0
            view.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func numbers(_ sender: UIButton) {
        if mathOperation == true{
                label.text = String(sender.tag - 1 )
                numberOnScreen = Double(label.text!)!
                mathOperation = false
        }
        else {
                label.text = label.text!  + String(sender.tag - 1)
                numberOnScreen = Double(label.text!)!
        }
    }
    @IBAction func button(_ sender: UIButton) {
        if label.text != "" && sender.tag !=  18 {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 14 {
                showpheptinh.text = "/"
            }
            if sender.tag == 15 {
                showpheptinh.text = "X"
            }
            if sender.tag == 16 {
                showpheptinh.text = "-"
            }
            if sender.tag == 17 {
                showpheptinh.text = "+"
            }
            operation = sender.tag
            mathOperation = true;
        }
        else if sender.tag == 18 {
            if operation == 14 {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 15 {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 16 {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 17 {
                label.text = String(previousNumber + numberOnScreen)
            }
        }

    }
    @IBAction func buttonClear(_ sender: UIButton) {
        label.text = ""
        previousNumber = 0
        numberOnScreen = 0
        operation = 0
        showpheptinh.text = ""
    }
    @IBAction func buttonChangeStatus(_ sender: UIButton) {
        numberOnScreen = -1 * numberOnScreen
        label.text = String(numberOnScreen)
    }
    @IBAction func buttonPercent(_ sender: UIButton) {
        numberOnScreen = numberOnScreen * 1/100
        label.text = String(numberOnScreen)
    }

}

