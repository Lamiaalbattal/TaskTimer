//
//  TimerView.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 08/01/2023.
//
import SwiftUI
import Accessibility

struct TimerView: View {
    
    @Binding var progress: Double
    @Binding var duration: Double
    
    var body: some View {
        ZStack {
            Circle().foregroundColor(Color("secondColor")).frame(width: 200, height: 200)
            if progress == 0 {
                Image(systemName: "arrowtriangle.right.fill")
                
                    .resizable()
                    .frame(width: 54, height: 60)
                    .foregroundColor(Color.accentColor).offset(x: 3, y: 0)
                    .accessibilityLabel("Add timer")
                
            } else {
                Text(getSecondsToDuration(Int(duration)))
                    .foregroundColor(Color.accentColor)
                    .font(.title3)
                    .accessibilityLabel(getSecondsToDuration(Int(duration)))
            }
            Circle()
                .trim(from: 0, to: CGFloat(progress) / 100)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .butt, dash: [2, 15]))
                .fill(LinearGradient(colors: [.accentColor , .pink],
                                     startPoint: .topLeading, endPoint: .trailing))
                .animation(.spring()).frame(width: 325, height: 325)
        }
    }
}

struct TimerActionView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button(action: { viewModel.stopTimerButton() },
                       label: { Image(systemName: "stop.fill").resizable().frame(width: 18, height: 18) })
                .accessibilityLabel("Stop timer")
                .frame(width: 50, height: 50)
                .foregroundColor(Color("splashColor"))
                .background(Color.accentColor).cornerRadius(25)
                .offset(x: viewModel.progress == 0 ? -1000 : 0, y: 0)
                Spacer()
                Button(action: { viewModel.timerActionButton() },
                       label: { Image(systemName: viewModel.timerActive ? "pause" : "arrowtriangle.right.fill").resizable().frame(width: 14, height: 18) })
                .accessibilityLabel("Pause timer")
                .frame(width: 50, height: 50)
                .foregroundColor(Color("splashColor"))
                .background(Color.accentColor).cornerRadius(25)
                .offset(x: viewModel.progress == 0 ? 1000 : 0, y: 0)
            }.padding(75)
        }.alert("Congratulations You did it honey 🥳" , isPresented:
                    $viewModel.isFinished)
        {}
        
    }
}
