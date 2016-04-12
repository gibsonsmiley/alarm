//
//  AlarmViewController.swift
//  Alarm
//
//  Created by Gibson Smiley on 4/12/16.
//  Copyright © 2016 Gibson Smiley. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AlarmViewController.updateLabel), name: "alarmComplete", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    func updateLabel() {
        label.text = "Your Alarm Has Not Been Set."
        button.setTitle("Set Alarm", forState: .Normal)
    }
    
    // MARK: - Actions
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if Alarm.sharedInstance.endDate == nil {
            let endDate = datePicker.date
            Alarm.sharedInstance.setAlarm(endDate)
            let dateFormatter = NSDateFormatter()
            dateFormatter.timeStyle = .ShortStyle
            dateFormatter.dateStyle = .LongStyle
            label.text = "Your Alarm Is Set For: \n \(dateFormatter.stringFromDate(endDate))"
            button.setTitle("Cancel Alarm", forState: .Normal)
        } else {
            Alarm.sharedInstance.cancelAlarm()
            updateLabel()
        }
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
