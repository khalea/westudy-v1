//
//  Notifications.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/16/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI
import UserNotifications

struct Notifications: View {
    var body: some View {
       
        
        VStack {
            Text("Hello, World!")
            
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }

            Button("Schedule Notification") {
               let content = UNMutableNotificationContent()
                content.title = "Upcoming Session"
                content.subtitle = "You have a session starting soon"
                content.sound = UNNotificationSound.default

                
                // Configure the recurring date.
                var dateComponents = DateComponents()
                dateComponents.calendar = Calendar.current

                dateComponents.weekday = 3  // Tuesday
                dateComponents.hour = 14    // 14:00 hours
                   
                // Create the trigger as a repeating event.
                let trigger = UNCalendarNotificationTrigger(
                         dateMatching: dateComponents, repeats: true)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
