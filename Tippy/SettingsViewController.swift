//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Lin, Dennis on 3/12/17.
//  Copyright © 2017 Lin, Dennis. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segmentedControllerDefaultTip: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateDefaultTipIndex(_ sender: Any) {
        let defaults = UserDefaults.standard
       
        defaults.set(segmentedControllerDefaultTip.selectedSegmentIndex, forKey: "defaultTipPercentageIndex")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let stringIndex = defaults.string(forKey: "defaultTipPercentageIndex")
        let defaultTipPercentageIndex = (nil == stringIndex) ? 2 : Int(stringIndex!)
        
        segmentedControllerDefaultTip.selectedSegmentIndex = defaultTipPercentageIndex!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
}
