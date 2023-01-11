//
//  HomeView.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 08/01/2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        
        ZStack {
            VStack (spacing:15){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 150)
                    .accessibilityLabel("Task timer logo")
                
                Spacer()
                
            }
            
            Button(action: { viewModel.displayPickerSheet() }, label: { TimerView(progress: $viewModel.progress, duration: $viewModel.duration) })
            TimerActionView(viewModel: viewModel)
            
                .blur(radius: viewModel.showPickerSheet ? 15 : 0)
            // Picker Sheet
            
            CountPickerView(viewModel: viewModel).offset(x: 0, y: viewModel.showPickerSheet ? 0 : 1500)
            
        }
        
        .animation(.spring())
   
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

