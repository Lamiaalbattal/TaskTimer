//
//  SingleOnboardingView.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 03/01/2023.
//

import SwiftUI

struct SingleOnbordingView: View {
    @AppStorage("isUserOnboarded") var isUserOnboarded: Bool = false
    let onbordingType: OnbordingType
    
    var body: some View {
        
        VStack(spacing:20) {
            Text(onbordingType.title)
                .multilineTextAlignment(.center)
                .font(.title).bold()
            
            Text(onbordingType.description)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
        

            Image(onbordingType.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
            

            if onbordingType == .work {
                Button {
                    withAnimation(.spring()) {
                        isUserOnboarded = true
                    }
                } label: {
                    
                    Text("Get Started")
                        .font(.headline)
                        .padding()
                        .foregroundColor(Color.white)
                        .frame(width: 300, height: 50)
                        .background(Color("AccentColor"))
                        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        
                }
                
            }
            
        }
                .padding(.horizontal,40)
        
        
    }

    
    struct SingleOnbordingView_Previews: PreviewProvider {
        static var previews: some View {
            SingleOnbordingView(onbordingType: OnbordingType.time)
        }
    }
    
}
