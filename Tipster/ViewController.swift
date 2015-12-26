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
    @IBOutlet weak var calcualteTipView: UIView!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billText.placeholder = (NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as! String)
        billText.text = defaults.stringForKey("com.dgh0st.billtext")
        if(billText.text == "0"){
            billText.text = ""
        }
        billText.becomeFirstResponder()
        onEditingChanged(billText)
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if(defaults.boolForKey("com.dgh0st.settingschanged") || defaults.boolForKey("com.dgh0st.appclosed")) {
            defaults.setBool(false, forKey: "com.dgh0st.appclosed")
            defaults.setBool(false, forKey: "com.dgh0st.settingschanged")
            defaults.synchronize()
            tipControl.selectedSegmentIndex = defaults.integerForKey("com.dgh0st.defaultpercent")
            peopleControl.selectedSegmentIndex = defaults.integerForKey("com.dgh0st.defaultpeople")
            if((defaults.stringForKey("com.dgh0st.percentdisplayed0")) != nil){
                for(var i = 0; i < 3; i++){
                    tipControl.setTitle(defaults.stringForKey("com.dgh0st.percentdisplayed" + String(i)), forSegmentAtIndex:i)
                }
            }
            if((defaults.stringForKey("com.dgh0st.peopledisplayed0")) != nil){
                for(var i = 0; i < 5; i++){
                    peopleControl.setTitle(defaults.stringForKey("com.dgh0st.peopledisplayed" + String(i)), forSegmentAtIndex:i)
                }
            }
        }
        onEditingChanged(billText)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        if(billText.text == ""){
            UIView.animateWithDuration(0.35, animations: {
                self.billText.frame.origin.y = 150
                self.tipControl.frame.origin.y = 664
                self.calcualteTipView.frame.origin.y = 736
            })
        } else {
            UIView.animateWithDuration(0.35, animations: {
                self.billText.frame.origin.y = 65
                self.tipControl.frame.origin.y = 182
                self.calcualteTipView.frame.origin.y = 218
            })
        }
        var tipPercentages = [0.18, 0.2, 0.22]
        for(var i = 0; i < 3; i++){
            tipPercentages[i] = NSString(string: tipControl.titleForSegmentAtIndex(i)!).doubleValue / 100
        }
        
        var people = [1, 2, 3, 4, 5]
        for(var i = 0; i < 5; i++){
            people[i] = NSString(string: peopleControl.titleForSegmentAtIndex(i)!).integerValue
        }
        
        let billAmount = NSString(string: billText.text!).doubleValue
        defaults.setDouble(billAmount, forKey: "com.dgh0st.billtext")
        let tip = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
        let perPerson = (billAmount + tip)/Double(people[peopleControl.selectedSegmentIndex])
        
        tipLabel.text = String(format:"%@%.2f", (NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as! String), tip)
        totalLabel.text = String(format: "%@%.2f", (NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as! String), perPerson)
        defaults.synchronize()
    }
}

