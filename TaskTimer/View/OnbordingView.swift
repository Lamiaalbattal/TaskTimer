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
    
    var localizedString: String {
        switch self {
        case .time:
            return NSLocalizedString("Master you minutes to master your life" , comment: "")
        case .task:
            return NSLocalizedString("Manage Your Tasks" , comment: "")
        case .work:
            return NSLocalizedString("Work On Time" , comment: "")
    
        }
    }
    
    var description: String {
        switch self {
        case .time:
            return ""
        case .task:
            return NSLocalizedString("A conveninet and easy task timer" , comment: "")
        case .work:
            return NSLocalizedString("Get your task done on time" , comment: "")
    
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
                
                ForEach(OnbordingType.allCases, id: \.localizedString) { onbording in
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

