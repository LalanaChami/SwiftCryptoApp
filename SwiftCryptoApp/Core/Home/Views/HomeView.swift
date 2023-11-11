//
//  HomeView.swift
//  SwiftCryptoApp
//
//  Created by Lalana Chamika on 2023-11-11.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false;
    
    var body: some View {
        ZStack {
            // Background layer
            Color.theme.background.ignoresSafeArea()
            
            // Content layer
            VStack {
    
                homeHeader
                
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

extension HomeView {
    private var homeHeader: some View {
        HStack{
            CircleButtionView(iconName: showPortfolio ? "plus": "info")
                .animation(.none, value: 0)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Watchlist")
                .animation(.none, value: 0)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtionView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180: 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }.padding(.horizontal)
    }
}
