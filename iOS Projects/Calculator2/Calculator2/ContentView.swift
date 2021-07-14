//
//  ContentView.swift
//  Calculator2
//
//  Created by in112-05-2021-cm on 07/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstNumber = ""
    @State var secondNumber = ""
    @State var result = "0"
    @State var showAlert = false
    @State var activeAlert: typeOfError = .firstNumMissing
    
    
    enum Operation {
        case Add
        case Subtract
        case Multiply
        case Divide
    }
    
    enum typeOfError {
        case firstNumMissing
        case secondNumMissing
    }
    

    func commit(_ firstNum: String, _ secondNum: String, _ operation: Operation) -> Void {
        
        if let firstValue = Int(firstNum) {
            
            if let secondValue = Int(secondNum) {
                
                //print("Processed")
                
                var resultValue : Int
                
                switch operation {
                
                case .Add:
                    resultValue = firstValue + secondValue
                case .Subtract:
                    resultValue = firstValue - secondValue
                case .Multiply:
                    resultValue = firstValue * secondValue
                case .Divide:
                    resultValue = firstValue / secondValue
                }
                
                result = "\(resultValue)"
                
            } else {
                
                self.activeAlert = .secondNumMissing
                showAlert = true
                
            }
            
        } else {
            
            self.activeAlert = .firstNumMissing
            showAlert = true
            
        }
        
    }
    
    var body: some View {
        
        VStack(spacing: 10.0) {
            
            Text("Calculator")
                .font(.system(size: 44))
                .padding(.bottom, 50.0)
            
                
            VStack(spacing: 15.0) {
            
                TextField("First Number", text: $firstNumber)
                    .padding(.horizontal, 10.0)
                    .padding(.vertical, 5.0)
                    .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.gray, lineWidth: 1))
            
                TextField("Second Number", text: $secondNumber)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.gray, lineWidth: 1))
            
            }.padding(.horizontal, 50.0).padding(.vertical, 5.0)
            
            HStack(spacing: 10.0) {
                CustomButton(handler: {
                    commit(firstNumber, secondNumber, .Add)
                }, content: {
                    Image(systemName: "plus")
                })
                
                CustomButton(handler: {
                    commit(firstNumber, secondNumber, .Subtract)
                }, content: {
                    Image(systemName: "minus")
                })
                
                CustomButton(handler: {
                    commit(firstNumber, secondNumber, .Multiply)
                }, content: {
                    Image(systemName: "multiply")
                })
                
                CustomButton(handler: {
                    commit(firstNumber, secondNumber, .Divide)
                }, content: {
                    Image(systemName: "divide")
                })
                
            }.padding(.vertical, 10.0)
            
            HStack(spacing: 10.0) {
                Text("Result:").font(.system(size: 28))
                
                Text(result).font(.system(size: 28))
            }
        }
        .alert(isPresented: $showAlert) {
            switch activeAlert {
               
                case .firstNumMissing:
                    return Alert(title: Text("Oops"), message: Text("You haven't inputted the first number."))
                    
                case .secondNumMissing:
                    return Alert(title: Text("Oops"), message: Text("You haven't inputted the second number."))
                    
        }
    }
}
    
}
/*
struct ActionButtonStyle : ButtonStyle {
    func makeBody(configuration : Configuration) -> some View {
        configuration.label
            .font(.title)
            .frame(width: 54, height: 54)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(27.0)
    }
}
*/

struct CustomButton<Content: View>: View {
    let handler: () -> Void
    let content: () -> Content
    
    var body: some View {
        Button(action: handler, label: content)
            .font(.title)
            .frame(width: 54, height: 54)
            .background(RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 1, endRadius: 200))
            .foregroundColor(.white)
            .cornerRadius(27.0)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
