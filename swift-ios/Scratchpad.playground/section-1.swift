// Playground - noun: a place where people can play

import Foundation

//var str = "Hello, playground"
//
//let ncenter = NSUserNotificationCenter.defaultUserNotificationCenter()
//
//let notif = NSUserNotification()
//notif.title = "Hi there"
//
//let time = NSDate(timeIntervalSinceNow: 4)
//notif.deliveryDate = time
//
//ncenter.deliverNotification(notif)

//let userUrl = NSURL(string: "https://api.github.com/user")
//
//let request = NSMutableURLRequest(URL: userUrl!)
//
let authToken = "bc7c6b9b36a17ec8f3689c12fdb25ae2fae1a0cb"
//let requestHeaderKey = "x-oauth-basic"
//
//request.HTTPMethod = "GET"
//request.setValue(authToken, forKey: requestHeaderKey)


let encodedToken = authToken.dataUsingEncoding(NSUTF8StringEncoding)
if let token = encodedToken {
  let auth = token.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
}