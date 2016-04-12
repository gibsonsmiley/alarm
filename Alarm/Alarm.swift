//
//  Alarm.swift
//  Alarm
//
//  Created by Gibson Smiley on 4/12/16.
//  Copyright © 2016 Gibson Smiley. All rights reserved.
//

import UIKit

class Alarm: NSObject {
    static let sharedInstance = Alarm()
    var endDate: NSDate?
    var isArmed: Bool {
        if endDate == nil {
            return false
        } else {
            return true
        }
    }
    var localNotificaion: UILocalNotification?
    
    func setAlarm(fireDate: NSDate) {
        if isArmed == false {
            endDate = fireDate
            localNotificaion = UILocalNotification()
            localNotificaion?.alertBody = "Your Alarm is Complete!"
            localNotificaion?.fireDate = endDate
            UIApplication.sharedApplication().scheduleLocalNotification(localNotificaion ?? UILocalNotification())
        }
    }
    
    func cancelAlarm() {
        if isArmed {
            endDate = nil
            UIApplication.sharedApplication().cancelLocalNotification(localNotificaion ?? UILocalNotification())
        }
    }
    
    func alarmComplete() {
        NSNotificationCenter.defaultCenter().postNotificationName("alarmComplete", object: nil)
        endDate = nil
    }
}