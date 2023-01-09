//
//  Home.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 08/01/2023.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var pomodoroModel: PomodoroMode1
    var body: some View {
        VStack{
            
            Text ("Pomodoro Timer")
            
                .font(.title2.bold ())
            
                .foregroundColor (.white)
            
            GeometryReader {proxy in
                
                VStack(spacing: 15) {
                    
                    ZStack{
                        
                        Circle()
                            .fill(.white.opacity(0.03))
                            .padding(-40)
                        Circle ()
                            .trim(from: 0, to: pomodoroModel.progress)
                            .stroke(.white.opacity (0.03) , lineWidth: 80)
                        
                        Circle()
                            .stroke(Color("Blue2"), lineWidth:
                                        5)
                            .blur(radius: 15)
                            .padding (-2)
                        
                        Circle()
                            .fill(Color ( "BG" ))
                        Circle()
                            .trim(from: 0, to: pomodoroModel.progress)
                            .stroke(Color("Blue2") .opacity(0.7)
                                    ,lineWidth: 10)
                        
                        GeometryReader{proxy in
                            let size = proxy.size
                            Circle ()
                                .fill (Color ("Blue2" ))
                                .frame (width: 30, height: 30)
                                .overlay (content: {
                                    Circle ()
                                        .fill (.white)
                                        .padding (5)
                                } )
                                .frame (width: size.width, height: size.height, alignment:  .center)
                                .offset(x: size.height / 2)
                                .rotationEffect(.init(degrees: pomodoroModel.progress * 360))
                        }
                        Text(pomodoroModel.timerStringValue)
                            .font(.system(size: 45, weight : .light))
                            .rotationEffect(.init(degrees: -90))
                            .animation(.none, value: pomodoroModel.progress)
                        
                        
                    }
                    .padding (60)
                    .frame (height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.easeInOut, value: pomodoroModel.progress)
                    .frame (maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                    Button {
                        if pomodoroModel.isStarted{
                        } else {
                            pomodoroModel.addNewTimer = true
                        }
                    } label: {
                        Image(systemName:!pomodoroModel.isStarted ? "timer" : "pause")
                            .font(.largeTitle.bold())
                            .foregroundColor (.white)
                            .frame (width: 80, height: 80)
                            .background{
                                Circle ()
                                    .fill (Color ("Blue2"))
                            }
                            .shadow (color: Color ("Blue2"), radius: 8, x: 0, y: 0)
                        
                    }
                    
                }
                
                .frame (maxWidth: .infinity, maxHeight:
                        .infinity, alignment: .center)
            }
        }
        .padding ()
        .background{
            Color ("BG" )
                .ignoresSafeArea ()
        }
        overlay (content: {
            
            ZStack{
                
                Color.black
                
                    .opacity (pomodoroModel.addNewTimer ? 0.25 : 0)
                
                // NewTimerView()
                
                    .offset (y: pomodoroModel.addNewTimer ? 0 : 400)
                
            }
            
            .animation(.easeInOut, value: pomodoroModel.addNewTimer)
            
        })
        .preferredColorScheme (.dark)
    }
    
    @ViewBuilder
    
    func NewTimerView()->some View{
        
        VStack(spacing: 15){
            Text ("Add New Timer")
                .font (.title2.bold())
                .foregroundColor (.white)
            .padding (.top, 10)}
        
        padding ()
            .frame (maxWidth: .infinity)
            .background{
                RoundedRectangle (cornerRadius: 10, style: .continuous)
                    .fill (Color ("BG" ))
                    .ignoresSafeArea ()
            }
    }
    
    
    
    
    struct Home_Previews: PreviewProvider {
        
        @EnvironmentObject var pomodoroModel: PomodoroMode1
        
        static var previews: some View {
            Home()
//                .environmentObject(PomodoroMode1())
            
        }
    }
}
