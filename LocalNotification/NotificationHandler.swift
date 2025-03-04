//
//  NotificationHandler.swift
//  LocalNotification
//
//  Created by Aditya Patole on 14/01/25.
//

import UIKit

@MainActor
class ViewModel: ObservableObject {
    @Published var sliderValue: Int = 20
    @Published var count: Int = 10
    @Published var showAlert: Bool = false
    var alertText: String = ""
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Hydrate!"
        content.sound = UNNotificationSound.default
        
        for i in 1...count {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(sliderValue * 60 * i), repeats: false)
            let request = UNNotificationRequest(identifier: "reminderNotification\(i)", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                DispatchQueue.main.async {
                    if let error = error {
                        self.alertText = "Error scheduling notification: \(error.localizedDescription)"
                        print("Error scheduling notification: \(error.localizedDescription)")
                    } else {
                        self.alertText = "Notification scheduled successfully"
                        self.showAlert = true
                        print("Notification scheduled successfully")
                    }
                }
            }
        }
    }
    
    func removeAllExistingNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
