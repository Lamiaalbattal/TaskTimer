//
//  TaskPage.swift
//  TaskTimer
//
//  Created by Lamia Aldossari on 04/01/2023.
//

import SwiftUI

struct TaskPage: View {
    @State var showSheet: Bool = false
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Add Task")
                    .font(.title2)
                    .background(
                Image("Image")
                    .position(x:-60,y:319)
                    )
//                    .accessibilityLabel("Add Tasks")
//                    .accessibilityIdentifier("it's text")
                
           }
            .navigationBarTitle("Tasks")
            .toolbar{
                ToolbarItem(placement:
                        .navigationBarTrailing){
                            Button(action:{
                                showSheet.toggle()
                                
                            }, label: {
                                Label( "Add" , systemImage:("plus"))
                                
                            } )
                            .sheet(isPresented: $showSheet) {
                                SecondScreen()
                            }
                        }
                }
        }
    }
}


struct SecondScreen : View{
    @State private var taskName = ""
    @State var hourSelection = 0
    @State var minuteSelection = 0
    @State var secondSelection = 0
    

    var hours = [Int](0..<24)
    var minutes = [Int](0..<60)
    var seconds = [Int](0..<60)
    
    var body: some View{
        NavigationView{
                VStack{
                    
                    TextField("Task Name", text: $taskName)
                        .padding()
                        .frame(width: 300 , height: 50)
                        .background(Color("secondColor"))
                        .cornerRadius(8)
                        .padding()
                        .cornerRadius(8)
                    
                    
                    GeometryReader{ geometry in
                        HStack(spacing:1){
                            Picker(selection: self.$hourSelection, label: Text("")){
                                ForEach(0 ..< self.hours.count){
                                    index in Text("\(self.hours[index]) h").tag(index)
                                }
                                
                            }
                         .frame(width: geometry.size.width/3 , height: 50 , alignment: .center)
                            .clipped()
                            
                            Picker(selection: self.$minuteSelection, label: Text("")){
                                ForEach(0 ..< self.minutes.count){
                                    index in Text("\(self.minutes[index]) m").tag(index)
                                }
                                
                            }
                            .frame(width: geometry.size.width/3 , height: 50 , alignment: .center)
                        
                            .clipped()
                            
                            Picker(selection: self.$secondSelection, label: Text("")){
                                ForEach(0 ..< self.seconds.count){
                                    index in Text("\(self.seconds[index]) s").tag(index)
                                }
                                
                            }
                           .frame(width: geometry.size.width/3 , height: 50 , alignment: .center)
                            .clipped()
                        }}
                    .pickerStyle(.wheel)
                    .frame(width: 300 , height: 50)
                    .background(Color("secondColor"))
                    .cornerRadius(8)
                  
                    
//                    Button("Save" , action:{
                        NavigationLink(destination: timerPage(), label: {
                            Text("save")
                        })
                    
                        
//                    } )
                    .padding()
                    .frame(width: 300 , height: 50)
                    .foregroundColor(.white)
                    .background(Color("AccentColor"))
                    .cornerRadius(8)
                    .padding(.top,30)
                    
                    
                    .navigationTitle("Add Task")
                    .navigationBarTitleDisplayMode(.inline)
                    
                    }
                }
            }
    
 
        
   
    }
        
        
        
    

        
            struct TaskPage_Previews: PreviewProvider {
                static var previews: some View {
                    TaskPage()
                }
            }
            

