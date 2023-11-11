//
//  HomeView.swift
//  SwiftCryptoApp
//
//  Created by Amila Manathunga on 2023-11-11.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Background layer
            Color.theme.background.ignoresSafeArea()
            
            // Content layer
            VStack {
                Text("Header")
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView().navigationBarHidden(true)
    }
    
}
