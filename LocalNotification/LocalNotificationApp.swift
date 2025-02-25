//
//  LocalNotificationApp.swift
//  LocalNotification
//
//  Created by Aditya Patole on 14/01/25.
//

import SwiftUI

@main
struct LocalNotificationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
