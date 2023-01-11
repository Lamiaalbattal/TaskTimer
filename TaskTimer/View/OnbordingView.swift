//
//  onboardingView.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 03/01/2023.
//

import SwiftUI


enum OnbordingType: CaseIterable {
    case time
    case task
    case work
    
    
    var image: String {
        switch self {
        case .time:
            return "time"
        case .task:
            return "task"
        case .work:
            return "work"
      
        }
    }
    
    var title: String {
        switch self {
        case .time:
            return "Master you minutes to master your life ."
        case .task:
            return "Manage Your Tasks"
        case .work:
            return "Work On Time"
    
        }
    }
    
    var description: String {
        switch self {
        case .time:
            return ""
        case .task:
            return "A conveninet and easy task tim"
        case .work:
            return "Get your task done on time"
    
        }
    }
}


struct OnbordingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isUserOnboarded") var isUserOnboarded: Bool = false
    @State var selectedOnboardingType: OnbordingType = .time
    
    var body: some View {
        ZStack {
            
            TabView(selection: $selectedOnboardingType) {
                
                ForEach(OnbordingType.allCases, id: \.title) { onbording in
                    SingleOnbordingView(onbordingType: onbording)
                        .tag(onbording)
                        .onChange(of: selectedOnboardingType, perform: { newValue in
                            selectedOnboardingType = newValue
                        })
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            if selectedOnboardingType != .work {
                skipButton
            }
        }
        .onAppear {
            setupAppearance()
        }
    }
}

struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingView()
    }
}

extension OnbordingView {
    var skipButton: some View {
        Button {
            withAnimation(.spring()) {
                isUserOnboarded = true
            }
        } label: {
            Text("skip")
                .padding(10)
        }
        .padding(.top, 1)
        .padding(.trailing)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .frame(maxHeight: .infinity, alignment: .top)
        .foregroundColor(.secondary)
    }
}

extension OnbordingView {
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor =
        colorScheme == .dark ? .white : .black
        UIPageControl.appearance().pageIndicatorTintColor = colorScheme == .dark ? UIColor.white.withAlphaComponent(0.2) : UIColor.black.withAlphaComponent(0.2)
    }
}

