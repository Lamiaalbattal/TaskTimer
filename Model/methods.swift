//
//  methods.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 08/01/2023.
//

import Foundation

// Convert seconds into hours, mins and seconds (90 -> 1m 30s)


let hoursStr = NSLocalizedString("hrs", comment: "")
let minutesStr = NSLocalizedString("min", comment: "")
let secondsStr = NSLocalizedString("sec", comment: "")


func getSecondsToDuration(_ duration: Int) -> String {
    let seconds = duration % 60
    let minutes = (duration / 60) % 60
    let hours = duration / 3600
    return "\(hours > 0 ? "\(hours) \(hoursStr) " : "")\(minutes > 0 ? "\(minutes) \(minutesStr) " : "")\(seconds > 0 ? "\(seconds) \(secondsStr)" : "")"
}
