import SwiftUI

struct CountPickerView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State var hoursIndex = 0
    @State var minsIndex = 0
    @State var secsIndex = 0
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Button(action: { viewModel.dismissPickerSheet() }, label: {
                                Image(systemName: "xmark")
                                    .resizable().frame(width: 12, height: 12)
                                    .font(Font.title.weight(.bold))
                           })
                        .frame(width: 32, height: 32).foregroundColor(Color.white)
                        .background(Color.accentColor).cornerRadius(25)
                }.padding(.top, 10)
                HStack(alignment: .center, spacing: 16) {
                    GenPickerView(label: "Hours", values: 24, index: $hoursIndex)
                    GenPickerView(label: "Minutes", values: 60, index: $minsIndex)
                    GenPickerView(label: "Seconds", values: 60, index: $secsIndex)
                }
                Button(action: { viewModel.startTimerButt(hours: hoursIndex, mins: minsIndex, secs: secsIndex) },
                       label: { Image(systemName: "arrowtriangle.right.fill").resizable().frame(width: 14, height: 18) })
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("splashColor"))
                    .background(Color.accentColor).cornerRadius(25)
                    .padding(.bottom, 30)
            }
            .padding(16).frame(maxWidth: .infinity)
            .background(Color("secondColor"))
            .cornerRadius(32)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct GenPickerView: View {
    
    var label: String, values: Int
    @Binding var index: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Text(label)
                .foregroundColor(Color.black)
            Picker(selection: $index, label: Text(""))
            {
                ForEach(0..<values) { i in
                    Text("\(i)")
//                        .foregroundColor(Color("splashColor")).frame(width: 35)
//                        .background(Color.accentColor)
                        .cornerRadius(8)
                }
              
            }
            .pickerStyle(.wheel)
                                  .frame(minWidth: 0)
                                  .compositingGroup()
                                  .clipped()
//            .pickerStyle(.inline)
//            .clipped()
//            .frame(maxWidth: 100 , maxHeight: 50).clipped()
        }
    }
}
