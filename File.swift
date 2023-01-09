//
//  File.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 08/01/2023.
//

import Foundation
@Published var progress = Double(0)
  
  var timer = Timer()
  @Published var timerActive = false
  @Published var duration = 0.0
  
  @Published var showPickerSheet = false
  
  init() { }
  
  func setTimer(hours: Int, minutes: Int, seconds: Int) {
      let hrs = hours * 3600, mins = minutes * 60, secs = seconds
      let seconds = secs + mins + hrs
      self.duration = Double(seconds)
  }
  
