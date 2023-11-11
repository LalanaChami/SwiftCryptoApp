//
//  ContentView.swift
//  SwiftCryptoApp
//
//  Created by Lalana Chamika on 2023-11-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Text("Accent Color")
                    .foregroundStyle(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .foregroundStyle(Color.theme.secondaryText)
                
                Text("Red Color")
                    .foregroundStyle(Color.theme.red)
                
                Text("Green Color")
                    .foregroundStyle(Color.theme.green)
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
        }
        
//        .padding()
    }
}

#Preview {
    ContentView()
}
