//
//  ContentView.swift
//  Shared
//
//  Created by Edward@Quahk on 30/06/2021.
//

import SwiftUI

struct ContentView: View {
    
enum CalcBtn: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percentage = "%"
    case negative = "+/-"
    
    var buttonColor: Color {
        switch self {
            case .add, .subtract, .multiply, .equal, .divide:
                return .orange
            case .clear, .negative, .percentage:
                return Color(.lightGray)
            default:
                return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}
    
    var body: some View {
        
        let buttons: [[CalcBtn]] = [
            [.clear, .negative, .percentage, .divide],
            [.seven, .eight, .nine, .multiply],
            [.four, .five, .six, .subtract],
            [.one, .two, .three, .add],
            [.zero, .decimal, .equal]
        ]
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("0")
                            .bold()
                            .font(.system(size: 64))
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    ForEach(buttons, id: \.self) { row in
                        HStack(spacing: 12) {
                            ForEach(row, id: \.self) { item in
                                Button(action: {
                                    
                                }, label: {
                                    Text(item.rawValue)
                                        .font(.system(size: 32))
                                        .foregroundColor(.white)
                                        .frame(width: self.buttonWidth(item: item),
                                               height: self.buttonHeight())
                                        .background(item.buttonColor)
                                        .cornerRadius(self.buttonWidth(item: item) / 2)
                                })
                            }
                        }
                        .padding(.bottom, 3)
                    }
                    
                }
            
        }
        
    }
    
    func buttonWidth(item: CalcBtn) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
