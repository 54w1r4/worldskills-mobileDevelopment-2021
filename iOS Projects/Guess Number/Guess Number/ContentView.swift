//
//  ContentView.swift
//  Guess Number
//
//  Created by in112-05-2021-cm on 14/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    let maxTries = 5
    
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
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                }
                
                Spacer()
                
                    VStack {
                    
                    }.padding(.trailing, 52.0)
                    .padding(.leading, 51.0)
                    .frame(maxWidth: 272, maxHeight: 118)
                    .background(Color(red: 83.0/255.0, green: 83.0/255.0, blue: 83.0/255.0))
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                
                    VStack {
                    
                    }.padding(.trailing, 52.0)
                    .padding(.leading, 51.0)
                    .frame(maxWidth: 272, maxHeight: 118)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                
                    VStack {
                    
                    }.padding(.trailing, 52.0)
                    .padding(.leading, 51.0)
                    .frame(maxWidth: 272, maxHeight: 118)
                    .background(Color(red: 83.0/255.0, green: 83.0/255.0, blue: 83.0/255.0))
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            
            
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
