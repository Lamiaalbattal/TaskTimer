//
//  timerPage.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 08/01/2023.
//

import SwiftUI

struct timerPage: View {
    @State var time:Int = 5
    @State var isCounterActive:Bool = false
    @State private var taskName = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            
            HStack{
                Image(systemName: "clock").resizable().frame(width: 40, height: 40)
                TextField("Task Name", text: $taskName)
                    .padding()
                    .frame(width: 300 , height: 50)
                    .background(Color("secondColor"))
                    .cornerRadius(8)
                    .padding()
                    .cornerRadius(8)
            }
            
            ZStack{
                Text("\(time)").bold().font(.system(size:100)).onReceive(timer) {_ in
                    if time > 0 && isCounterActive{
                        time -= 1
                    }else{
                        isCounterActive = false
                    }
                }
                
                Circle().strokeBorder(lineWidth: 5).padding().foregroundColor(.green)
            }
            
            HStack{
                ZStack{
                    Picker("Seconds:" , selection: $time){
                        ForEach(Array(stride(from: 0, to: 65, by: 5)), id: \.self) { index in
                            Button("\(index) Seconds"){
                                time = index
                            }
                        }
                        
                        
                        Picker("Minutes:" , selection: $time){
                            ForEach(Array(stride(from: 0, to: 65, by: 5)), id: \.self) { index in
                                Button("\(index) Minutes"){
                                    time = index
                                }
                            }
                        }.colorMultiply(.black)
                        
                        RoundedRectangle(cornerRadius: 25).strokeBorder(lineWidth: 3).frame(width: 190, height: 70).padding().foregroundColor(.black)
                    }
                }
                
                Spacer().frame(height: 50)
                
                HStack{
                    ZStack{
                        Button("Start"){
                            isCounterActive = true
                        }.foregroundColor(.black)
                        
                        RoundedRectangle(cornerRadius: 25).strokeBorder().frame(width: 90, height: 55).padding().foregroundColor(.green)
                    }
                    
                    ZStack{
                        Button("Stop"){
                            isCounterActive = false
                        }.foregroundColor(.black)
                        
                        RoundedRectangle(cornerRadius: 25).strokeBorder().frame(width: 90, height: 55).padding().foregroundColor(.red)
                    }
                    
                    ZStack{
                        Button("Reset"){
                            time = 0
                            isCounterActive = false
                        }.foregroundColor(.black)
                        
                        RoundedRectangle(cornerRadius: 25).strokeBorder().frame(width: 90, height: 55).padding().foregroundColor(.yellow)
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            timerPage()
        }
    }
}
