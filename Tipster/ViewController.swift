//
//  ViewController.swift
//  Tipster
//
//  Created by dpate71 on 12/4/15.
//  Copyright (c) 2015 DGh0st. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleControl: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var shouldGetOldValues = false
    
    override func viewDidLoad() {
        shouldGetOldValues = false
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        billText.becomeFirstResponder()
        
        tipControl.selectedSegmentIndex = defaults.integerForKey("com.dgh0st.defaultpercent")
        peopleControl.selectedSegmentIndex = defaults.integerForKey("com.dgh0st.defaultpeople")
        
        tipControl.setTitle(defaults.stringForKey("com.dgh0st.percent1"), forSegmentAtIndex:0)
        tipControl.setTitle(defaults.stringForKey("com.dgh0st.percent2"), forSegmentAtIndex:1)
        tipControl.setTitle(defaults.stringForKey("com.dgh0st.percent3"), forSegmentAtIndex:2)
        
        var startIndex = defaults.integerForKey("com.dgh0st.peoplerange")
        for(var i = 0; i < 5; i++){
            peopleControl.setTitle("\(startIndex++)", forSegmentAtIndex: i)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        tipPercentages[0] = defaults.doubleForKey("com.dgh0st.percent1") / 100
        tipPercentages[1] = defaults.doubleForKey("com.dgh0st.percent2") / 100
        tipPercentages[2] = defaults.doubleForKey("com.dgh0st.percent3") / 100
        
        var people = [1, 2, 3, 4, 5]
        var startIndex = defaults.integerForKey("com.dgh0st.peoplerange")
        for(var i = 0; i < 5; i++){
            people[i] = startIndex++
        }
        
        var billAmount = (billText.text as NSString).doubleValue
        var tip = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
        var perPerson = (billAmount + tip)/Double(people[peopleControl.selectedSegmentIndex])
        
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", perPerson)
    }
}

