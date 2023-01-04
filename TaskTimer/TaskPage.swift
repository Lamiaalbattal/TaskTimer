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
                    .position(x:-60,y:320)
                    )
                
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
    var body: some View{
        NavigationView{
            VStack{
                
                TextField("Task Name", text: $taskName)
                    .padding()
                    .frame(width: 300 , height: 50)
                    .background(Color("secondColor"))
                    .cornerRadius(8)
                    .padding()
                
                TextField("Task Name", text: $taskName)
                    .padding()
                    .frame(width: 300 , height: 50)
                    .background(Color("secondColor"))
                    .cornerRadius(8)
                
                
                Button("Save" , action:{
                    
                } )
                    .padding()
                    .frame(width: 300 , height: 50)
                    .foregroundColor(.white)
                    .background(Color("AccentColor"))
                    .cornerRadius(8)
                    .padding(.top,30)
                    
            }
            .navigationTitle("Add Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:
                        .navigationBarTrailing){
                            Button(action:{}
                                   
                                   , label: {
                                Text("Save")
                            })
                        }
                ToolbarItem(placement:
                        .navigationBarLeading){
                            Button(action:{}
                                   
                                   , label: {
                                Text("Cancel")
                            })
  }
            }
        }
    }
    struct TaskPage_Previews: PreviewProvider {
        static var previews: some View {
            TaskPage()
        }
    }
    
}
