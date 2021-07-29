//
//  ContentView.swift
//  Guess Number
//
//  Created by in112-05-2021-cm on 14/07/2021.
//

import SwiftUI

//class idk{
//    @Published var CN=25
//    @Published var startingNumber = 1
//    @Published var endingNumber = 100
//}

struct ContentView: View {
    
//    let textValueBinding = Binding<String>(get: {
//        self.enteredTextValue
//     }, set: {
//        self.enteredTextValue = $0
//
//     })
    
    let maxTries = 5
    @State var tries = 5
    @State var userChoice = ""
    @State var showResult = false
    @State var showAlert = false
    @State var startingNumber = 1
    @State var endingNumber = 500
    @State var activeResult: typeOfResult = .GameOver
    @State var activeAlert: typeOfError = .emptyValue
    @State var correctNumber = Int.random(in: 1..<100)
    
    enum typeOfResult {
        case Win
        case GameOver
    }
    
    enum typeOfError {
        case notInRange
        case emptyValue
    }
    
    let greenBackground = [
        Color(red: 234.0/255.0, green: 255.0/255.0, blue: 207.0/255.0),
        Color(red: 135.0/255.0, green: 217.0/255.0, blue: 52.0/255.0)
    ]
    
    var body: some View {
        
        ZStack {
            
            Rectangle().fill(LinearGradient(gradient: Gradient(colors: greenBackground), startPoint: .top, endPoint: .bottom))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 25.0) {
                  
                HStack {
                    
                    ForEach(0 ..< maxTries) { index in
                        if (tries > index) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.gray)
                        }
                        
                    }
                    
                    Spacer()
                    
                }.padding(.top, 41)
                .padding(.leading, 24)
                .padding(.bottom, 155)
                
                //Spacer()
                VStack(spacing: 25.0) {
                    
                    VStack {
                        
                        ZStack() {
                            
                            Text("MIN")
                                .fontWeight(.bold)
                                .font(.system(size: 20.0))
                                //.frame(width: 38, height: 23)
                                .padding(.trailing, 208.0)
                                .padding(.bottom, 68.0)
                            
                            Text(String(startingNumber))
                                .font(.system(size: 60.0))
                                .frame(width: 35, height: 70)
                                .padding(.top, 7.0)
                                
                        }
                        
  
                    }.frame(maxWidth: 272, maxHeight: 118)
                    .background(Color(red: 83.0/255.0, green: 83.0/255.0, blue: 83.0/255.0))
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                
                    VStack {
                        ZStack() {
                            
                            Text("YOUR GUESS")
                                .fontWeight(.bold)
                                .font(.system(size: 20.0))
                                .foregroundColor(Color(red: 0.0/255.0, green: 144.0/255.0, blue: 49.0/255.0))
                                //.frame(width: 120, height: 23)
                                .padding(.trailing, 124.0)
                                .padding(.bottom, 68.0)
                            
                            TextField("50", text: $userChoice, onCommit: {
                                checkNum(userChoice)
                            }).font(.system(size: 60.0))
                                .foregroundColor(Color(red: 0.0/255.0, green: 144.0/255.0, blue: 49.0/255.0))
                                .padding(.leading, 101.0)
                                .padding(.top, 22.0)
                                
                        }
                    }.frame(maxWidth: 272, maxHeight: 118)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                
                    VStack {
                        ZStack() {
                            
                            Text("MAX")
                                .fontWeight(.bold)
                                .font(.system(size: 20.0))
                                //.frame(width: 45, height: 23)
                                .padding(.trailing, 198.0)
                                .padding(.bottom, 68.0)
                                
                            
                            Text(String(endingNumber))
                                .font(.system(size: 60.0))
//                                .frame(width: 103, height: 70)
                                .padding(.top, 9.0)
                                
                        }
                    }.frame(maxWidth: 272, maxHeight: 118)
                    .background(Color(red: 83.0/255.0, green: 83.0/255.0, blue: 83.0/255.0))
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                }.padding(.trailing, 52.0)
                .padding(.leading, 51.0)
                          
            }
               
        }.fullScreenCover(isPresented: $showResult, content: {
            
            switch activeResult {
                case .Win:
                    WinView()
                
                case .GameOver:
                    GameOverView(correctNumber: String(Int.random(in: startingNumber..<endingNumber)))
//                    GameOverView(correctNumber: String(correctNumber))
                    //correctNumber = Int.random(in: 1..<100)
            }
            
            
        }).onAppear(perform: {
            correctNumber = Int.random(in: startingNumber..<endingNumber)
        }).alert(isPresented: $showAlert, content: {
            
            switch activeAlert {
                
                case .emptyValue:
                    return Alert(title: Text("Oops!"), message: Text("You haven't entered any number..."))
                    
                case .notInRange:
                    return Alert.init(title: Text("Oops!"), message: Text("Please enter a number between ") + String(startingNumber) + Text(" to ") + String(endingNumber))
            }
                
            
        })
            
    }
    func checkNum(_ userNumber: String) -> Void {
        if let userNumber = Int(userChoice) {
            if (userNumber <= endingNumber) && (userNumber >= startingNumber) {
                if (userNumber != correctNumber) && (tries > 1) {
                    tries -= 1
                } else if (userNumber != correctNumber) && (tries <= 1) {
                    activeResult = .GameOver
                    showResult = true
                    tries = 5;
                    userChoice = ""
                    //correctNumber = Int.random(in: startingNumber..<endingNumber)
                    //showResult = false
                    //GameOverView(message: String(correctNumber))
                    
                } else {
                    activeResult = .Win
                    showResult = true
                    tries = 5
                    correctNumber = Int.random(in: startingNumber..<endingNumber)
                    userChoice = ""
                }
            } else {
                // alert
                activeAlert = .notInRange
                showAlert = true
            }
        } else {
            activeAlert = .notInRange
            showAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding()
    }
}
