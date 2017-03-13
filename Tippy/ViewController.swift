//
//  ViewController.swift
//  Tippy
//
//  Created by Lin, Dennis on 3/12/17.
//  Copyright © 2017 Lin, Dennis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTipAmount: UILabel!
    @IBOutlet weak var labelTotalBill: UILabel!
    @IBOutlet weak var textfieldBillAmount: UITextField!
    @IBOutlet weak var segmentedControlTipPercentages: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let stringIndex = defaults.string(forKey: "defaultTipPercentageIndex")
        let defaultTipPercentageIndex = (nil == stringIndex) ? 2 : Int(stringIndex!)
        print("Default Tip Percentage index: \(defaultTipPercentageIndex)")
        
        segmentedControlTipPercentages.selectedSegmentIndex = defaultTipPercentageIndex!
        
        textfieldBillAmount.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func updateTotalBill2(_ sender: Any) {
        updateTotalBill(sender)
    }
    
    @IBAction func updateTotalBill(_ sender: Any) {
        let arrayTipPercentages = [0.15, 0.18, 0.20, 0.25]
        
        let doubleBillAmount = Double(textfieldBillAmount.text!) ?? 0;
        let doubleTipAmount = arrayTipPercentages[segmentedControlTipPercentages.selectedSegmentIndex] * doubleBillAmount
        let doubleTotalBill = ViewController.calculateTotalBill(billAmount: doubleBillAmount, tipPercentage: doubleTipAmount)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        labelTipAmount.text = formatter.string(from: NSNumber(value: doubleTipAmount)) ?? "$\(doubleTipAmount)"
        labelTotalBill.text = formatter.string(from: NSNumber(value: doubleTotalBill)) ?? "$\(doubleTotalBill)"
    }

    static func calculateTotalBill(billAmount: Double, tipPercentage: Double) -> Double {
        return billAmount * ( 1.00 + tipPercentage )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

