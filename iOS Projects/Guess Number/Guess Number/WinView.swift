//
//  WinView.swift
//  Guess Number
//
//  Created by in112-05-2021-cm on 28/07/2021.
//

import SwiftUI

struct WinView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    let blueBackground = [
        Color(red: 122.0/255.0, green: 167.0/255.0, blue: 255.0/255.0),
        Color(red: 0.0/255.0, green: 59.0/255.0, blue: 172.0/255.0)
    ]
    
    var body: some View {
        ZStack {
            
            Rectangle().fill(LinearGradient(gradient: Gradient(colors: blueBackground), startPoint: .top, endPoint: .bottom))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("🎉")
                    .font(.system(size: 100.0))
                    .padding(.bottom, 26.0)
                
                Text("YOU WIN")
                    .font(.system(size: 28.0))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 64.0)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Start Over").font(.system(size: 28.0)).bold()
                }).frame(width: 191.0, height: 56.0, alignment: .center)
                .background(Color.white)
                .foregroundColor(.gray)
                .cornerRadius(20.0)
                
            }
        }
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView()
    }
}
