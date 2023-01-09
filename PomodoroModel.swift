//
//  PomodoroModel.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 08/01/2023.
//

//
//  PomodoroModel.swift
//  PomodoroTime
//
//  Created by AtheerAlshehri on 08/01/2023.
//

import SwiftUI

class PomodoroMode1: NSObject,ObservableObject {
    
    @Published var progress: CGFloat = 1
    @Published var timerStringValue: String = "00:00"
    @Published var isStarted: Bool = false
    @Published var addNewTimer: Bool = false
    @Published var hour: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
}

//struct PomodoroModel_Previews: PreviewProvider {
//    static var previews: some View {
//        PomodoroModel()
//    }
//}
