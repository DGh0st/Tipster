//
//  SettingsViewController.swift
//  Tipster
//
//  Created by DGh0st on 12/17/15.
//  Copyright © 2015 DGh0st. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultPercentControl: UISegmentedControl!
    @IBOutlet weak var defaultPeopleControl: UISegmentedControl!
    @IBOutlet weak var leftPercentStepper: UIStepper!
    @IBOutlet weak var middlePercentStepper: UIStepper!
    @IBOutlet weak var rightPercentStepper: UIStepper!
    @IBOutlet weak var leftPeopleStepper: UIStepper!
    @IBOutlet weak var middleLeftPeopleStepper: UIStepper!
    @IBOutlet weak var middlePeopleStepper: UIStepper!
    @IBOutlet weak var middleRightPeopleStepper: UIStepper!
    @IBOutlet weak var rightPeopleStepper: UIStepper!
    @IBOutlet weak var leftPercentText: UILabel!
    @IBOutlet weak var middlePercentText: UILabel!
    @IBOutlet weak var rightPercentText: UILabel!
    @IBOutlet weak var leftPeopleText: UILabel!
    @IBOutlet weak var middleLeftPeopleText: UILabel!
    @IBOutlet weak var middlePeopleText: UILabel!
    @IBOutlet weak var middleRightPeopleText: UILabel!
    @IBOutlet weak var rightPeopleText: UILabel!
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultPercent = defaults.integerForKey("com.dgh0st.defaultpercent")
        let defaultpeople = defaults.integerForKey("com.dgh0st.defaultpeople")
        defaultPercentControl.selectedSegmentIndex = defaultPercent
    if((defaults.stringForKey("com.dgh0st.percentdisplayed0")) != nil){
            leftPercentStepper.value = defaults.doubleForKey("com.dgh0st.percentdisplayed0")
        }
    if((defaults.stringForKey("com.dgh0st.percentdisplayed1")) != nil){
            middlePercentStepper.value = defaults.doubleForKey("com.dgh0st.percentdisplayed1")
        }
    if((defaults.stringForKey("com.dgh0st.percentdisplayed2")) != nil){
            rightPercentStepper.value = defaults.doubleForKey("com.dgh0st.percentdisplayed2")
        }
        
        defaultPeopleControl.selectedSegmentIndex = defaultpeople
    if((defaults.stringForKey("com.dgh0st.peopledisplayed0")) != nil){
            leftPeopleStepper.value = NSString(string: defaults.stringForKey("com.dgh0st.peopledisplayed0")!).doubleValue
        }
    if((defaults.stringForKey("com.dgh0st.peopledisplayed1")) != nil){
            middleLeftPeopleStepper.value = defaults.doubleForKey("com.dgh0st.peopledisplayed1")
        }
    if((defaults.stringForKey("com.dgh0st.peopledisplayed2")) != nil){
            middlePeopleStepper.value = defaults.doubleForKey("com.dgh0st.peopledisplayed2")
        }
    if((defaults.stringForKey("com.dgh0st.peopledisplayed3")) != nil){
            middleRightPeopleStepper.value = defaults.doubleForKey("com.dgh0st.peopledisplayed3")
        }
    if((defaults.stringForKey("com.dgh0st.peopledisplayed4")) != nil){
            rightPeopleStepper.value = defaults.doubleForKey("com.dgh0st.peopledisplayed4")
        }
        updateStepperText()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changedSettings(sender: AnyObject) {
        defaults.setInteger(defaultPercentControl.selectedSegmentIndex, forKey: "com.dgh0st.defaultpercent")
        defaults.setInteger(defaultPeopleControl.selectedSegmentIndex, forKey: "com.dgh0st.defaultpeople")
        defaults.setDouble(leftPercentStepper.value, forKey: "com.dgh0st.percentdisplayed0")
        defaults.setDouble(middlePercentStepper.value, forKey: "com.dgh0st.percentdisplayed1")
        defaults.setDouble(rightPercentStepper.value, forKey: "com.dgh0st.percentdisplayed2")
        defaults.setDouble(leftPeopleStepper.value, forKey: "com.dgh0st.peopledisplayed0")
        defaults.setDouble(middleLeftPeopleStepper.value, forKey: "com.dgh0st.peopledisplayed1")
        defaults.setDouble(middlePeopleStepper.value, forKey: "com.dgh0st.peopledisplayed2")
        defaults.setDouble(middleRightPeopleStepper.value, forKey: "com.dgh0st.peopledisplayed3")
        defaults.setDouble(rightPeopleStepper.value, forKey: "com.dgh0st.peopledisplayed4")
        defaults.setBool(true, forKey: "com.dgh0st.settingschanged")
        defaults.synchronize()
        updateStepperText()
    }
    
    func updateStepperText(){
        leftPercentText.text = String(Int(leftPercentStepper.value)) + "%"
        middlePercentText.text = String(Int(middlePercentStepper.value)) + "%"
        rightPercentText.text = String(Int(rightPercentStepper.value)) + "%"
        leftPeopleText.text = String(Int(leftPeopleStepper.value))
        middleLeftPeopleText.text = String(Int(middleLeftPeopleStepper.value))
        middlePeopleText.text = String(Int(middlePeopleStepper.value))
        middleRightPeopleText.text = String(Int(middleRightPeopleStepper.value))
        rightPeopleText.text = String(Int(rightPeopleStepper.value))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
