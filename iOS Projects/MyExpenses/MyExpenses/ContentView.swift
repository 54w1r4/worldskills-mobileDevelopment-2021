//
//  ContentView.swift
//  MyExpenses
//
//  Created by Edward Swalker on 31/7/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                ExtractedView()
            }.listStyle(InsetGroupedListStyle())
            .navigationTitle(Text("My Expenses"))
            .navigationBarItems(trailing: Button(action: {}, label: {
                Image(systemName: "plus")
            }))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    
    var name = ""
    var total = 0.0
    var icon = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name")
                Text("$12.5").font(.caption)
            }
            Spacer()
            Image(systemName: "dollarsign.circle")
                .foregroundColor(.accentColor)
        }
    }
}
