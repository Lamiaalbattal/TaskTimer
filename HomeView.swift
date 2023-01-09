//
//  HomeView.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 08/01/2023.
//

import SwiftUI

struct HomeView: View {
    
//    let appWidth = UIScreen.main.bounds.width
//    let appHeight = UIScreen.main.bounds.height
//
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
//            Color.accentColor.edgesIgnoringSafeArea(.all)
//            Group {
//                BubbleView(size: 200, x: 70 - appWidth/2, y: appHeight/2 - 70)
//                BubbleView(size: 150, x: 10 - appWidth/2, y: appHeight/2 - 170)
//                BubbleView(size: 200, x: appWidth/2 - 40, y: 120 - appHeight/2)
//                BubbleView(size: 100, x: appWidth/2 - 40, y: 10 - appHeight/2)
                VStack {
                    HStack {
                        Text("TaskTimer")
                            .font(.title)
                            .foregroundColor(Color.accentColor)
                        Spacer()
                    }.padding(.top, 16).padding(.leading, 23)
                    Spacer()
                }
                Button(action: { viewModel.displayPickerSheet() }, label: { TimerView(progress: $viewModel.progress, duration: $viewModel.duration) })
                TimerActionView(viewModel: viewModel)
//            }
            .blur(radius: viewModel.showPickerSheet ? 15 : 0)
            // Picker Sheet
            CountPickerView(viewModel: viewModel).offset(x: 0, y: viewModel.showPickerSheet ? 0 : 1500)
        }
        .animation(.spring())
    }
}

//struct BubbleView: View {
//    let size: CGFloat, x: CGFloat, y: CGFloat
//    var body: some View {
//        ZStack {
//            Circle().foregroundColor(Color.pink)
//                .frame(width: size, height: size).offset(x: x, y: y)
//        }
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
