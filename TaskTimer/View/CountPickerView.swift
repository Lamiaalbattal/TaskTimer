






import SwiftUI
import Accessibility
struct CountPickerView: View {
    
    let hourStr = NSLocalizedString("hours", comment: "")
    let minuteStr = NSLocalizedString("mins", comment: "")
    let secondStr = NSLocalizedString("secs", comment: "")
    
    @ObservedObject var viewModel: HomeViewModel
    @State var hourSelection = 0
    @State var minuteSelection = 0
    @State var secondSelection = 0
    var hours = [Int](0..<24)
    var minutes = [Int](0..<60)
    var seconds = [Int](0..<60)
    
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
                            .accessibilityLabel("close")
                    })
                    .frame(width: 32, height: 32).foregroundColor(Color.white)
                    .background(Color.accentColor).cornerRadius(25)
                }.padding(.top, 10)
                
                GeometryReader{ geometry in
                    HStack(spacing:1){
                        Picker(selection: self.$hourSelection, label: Text("")){
                            ForEach(0 ..< self.hours.count){
                                index in Text("\(self.hours[index]) \(hourStr)").tag(index)
                                    .accessibilityLabel("hours")
                            }
                            
                        }
                        
                        Picker(selection: self.$minuteSelection, label: Text("")){
                            ForEach(0 ..< self.minutes.count){
                                index in Text("\(self.minutes[index]) \(minuteStr)").tag(index)
                                    .accessibilityLabel("minutes")
                                    .accessibilityValue("test voice over")
                                
                            }
                            
                        }
                        
                        Picker(selection: self.$secondSelection, label: Text("")){
                            ForEach(0 ..< self.seconds.count){
                                index in Text("\(self.seconds[index]) \(secondStr)").tag(index)
                                
                                    .accessibilityLabel("seconds")
                            }
                        }
                        
                    }
                    
                }
                
                .pickerStyle(.wheel)
                .frame(width: 300 , height: 100)
                
                Button(action: { viewModel.startTimerButt(hours: hourSelection, mins: minuteSelection, secs: secondSelection) },
                       label: { Image(systemName: "arrowtriangle.right.fill").resizable().frame(width: 14, height: 18) })
                .accessibilityLabel("Start")
                .frame(width: 50, height: 50)
                .offset(x: 2, y: 0)
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

