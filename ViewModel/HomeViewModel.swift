//
//  HomeViewModel.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 08/01/2023.
//

import Foundation
import UserNotifications
import SwiftUI
import NotificationCenter
class HomeViewModel:NSObject,ObservableObject,UNUserNotificationCenterDelegate {
    @Published var progress = Double(0)
    
    var timer = Timer()
    
    @Published var timerActive = false
    @Published var duration = 0.0
    @Published var isStarted: Bool = false
    @Published var isFinished: Bool = false
    @Published var showPickerSheet = false
    @Published var totalSeconds: Int = 0
    @Published var staticTotalSeconds: Int = 0
    @Published var timerStringvalue: String = "00:00"
    
    
    override init() {
        super.init ()
        self.authorizeNotification()
        
    }
   
    func authorizeNotification (){
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) { _, _ in
        }
        UNUserNotificationCenter.current().delegate = self
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){ completionHandler ([.sound,.banner])
        
    }
    
    func setTimer(hours: Int, minutes: Int, seconds: Int) {
        let hrs = hours * 3600, mins = minutes * 60, secs = seconds
        let seconds = secs + mins + hrs
        self.duration = Double(seconds)
        totalSeconds = (hours * 3600) + (minutes * 60) + seconds
        staticTotalSeconds = totalSeconds
    }
    
    func displayPickerSheet() {
        if duration == 0 { showPickerSheet = true }
    }
    
    func dismissPickerSheet() { showPickerSheet = false }
    
    func startTimerButt(hours: Int, mins: Int, secs: Int) {
        if hours != 0 || mins != 0 || secs != 0 {
            setTimer(hours: hours, minutes: mins, seconds: secs)
            enableTimerMethod()
            showPickerSheet = false
            addNotification()
           
        }
    }
    
    func enableTimerMethod() {
        timerActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.duration -= 1
            let seconds = Int(self.duration) % 60
            self.progress = 100 - Double((Double(seconds)/60) * 100)
            if self.duration <= 0 { self.stopTimerButton() }
        }
    }
    
    func timerActionButton() {
        if timerActive {
            timerActive = false
            timer.invalidate()
        } else { enableTimerMethod() }
        
    }
    func updateTimerButton(hours: Int, mins: Int, secs: Int) {
        if hours == 0 && mins == 0 && secs == 0{
            isStarted = false
            print("Finished")
        }
        
        
    }
    
    func stopTimerButton() {
        isFinished = true
        timerActive = false; timer.invalidate()
        progress = 0  ; duration = 0
        totalSeconds = 0
        staticTotalSeconds = 0
        timerStringvalue = "00:00"
        
        
    }
    
    
    func addNotification (){
        let content = UNMutableNotificationContent ( )
        content.title = "TaskTimer"
        content.subtitle = "Timer Is Completed Successfully 🥳"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID() .uuidString, content: content, trigger:
                                                UNTimeIntervalNotificationTrigger(timeInterval:TimeInterval(staticTotalSeconds),repeats:false))
        UNUserNotificationCenter.current().add(request)
    }
}

