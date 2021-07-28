//
//  GameOverView.swift
//  Guess Number
//
//  Created by in112-05-2021-cm on 28/07/2021.
//

import SwiftUI

struct GameOverView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var correctNumber: String
    
    let grayBackground = [
        Color(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0),
        Color(red: 108.0/255.0, green: 108.0/255.0, blue: 108.0/255.0)
    ]
    
    var body: some View {
        
        ZStack {
            idk.CN =Int.random(in: startingNumber..<endingNumber)
            Rectangle().fill(LinearGradient(gradient: Gradient(colors: grayBackground), startPoint: .top, endPoint: .bottom))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("😵")
                    .font(.system(size: 100.0))
                    .padding(.bottom, 26.0)
                
                Text("GAME OVER")
                    .font(.system(size: 28.0))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 54.0)
                
                Text("Correct Number:")
                    .font(.system(size: 28.0))
                    .foregroundColor(.white)
                    .bold()
                
                Text(correctNumber)
                    .font(.system(size: 28.0))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 54.0)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Try Again").font(.system(size: 28.0)).bold()
                }).frame(width: 191.0, height: 56.0, alignment: .center)
                .background(Color.white)
                .foregroundColor(.gray)
                .cornerRadius(20.0)
                
            }
        }
        
        
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(correctNumber: "NaN")
    }
}
