//
//  ViewController.swift
//  CoachFinder
//
//  Created by qingjiezhao on 6/4/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var level: UISlider!
    
    @IBOutlet weak var levelValue: UILabel!
    
    @IBOutlet weak var cert: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func levelChanged(sender: AnyObject) {
        var slider = sender as! UISlider
        var i = Int(slider.value)
        slider.value = Float(i)
        levelValue.text = "\(i)"
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        name.resignFirstResponder()
    }

    @IBAction func okTapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex == 0 ? "Male" : "Female"
        let certText = cert.on ? "Yes" : "No"
        
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now  = NSDate()
        let components = gregorian?.components(NSCalendarUnit.CalendarUnitYear, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(0))
      
        let age = components?.year
        result.text = "I am \(name.text),\(genderText),\(age!),\(levelValue.text!),\(certText). I want a coach."
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

