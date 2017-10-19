// Playground - noun: a place where people can play

import Foundation

//class Focus : NSObject {
//    let MINUTES = 25
//    
//    init(task: String) {
//        let notification = NSUserNotification()
//        let interval = MINUTES * 60
//        let date = NSDate(timeIntervalSinceNow: NSTimeInterval(interval))
//        
//        notification.title = task
//        notification.deliveryDate = date
//        
//        let nc = NSUserNotificationCenter.defaultUserNotificationCenter()
//        nc.scheduleNotification(notification)
//    }
//}

//let title = Process.arguments[1]
//let title = "test"
//
//Focus(task: title)

let nc = NSUserNotificationCenter.defaultUserNotificationCenter()

println(nc.scheduledNotifications.count)


//nc.scheduledNotifications = []
