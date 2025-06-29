//
//  AppDelegate.swift
//  Utilix
//
//  Created by Aditya Patole on 14/01/25.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
//    func application(
//            _ application: UIApplication,
//            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//        ) -> Bool {
//            // Custom initialization code
//            return true
//        }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }
        return true
    }
}
