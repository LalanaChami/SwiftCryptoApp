//
//  HomeView.swift
//  SwiftCryptoApp
//
//  Created by Lalana Chamika on 2023-11-11.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @State private var showPortfolio: Bool = false;
    
    var body: some View {
        ZStack {
            // Background layer
            Color.theme.background.ignoresSafeArea()
            
            // Content layer
            VStack {
    
                homeHeader
                columnTitles
                if !showPortfolio {
                    allCoinList
                } else {
                    portfolioCoinList
                }
                
                
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView().navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    
    // Header
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
    
    // All coin list
    private var allCoinList: some View {
        List {
            ForEach(homeViewModel.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 5))
            }
            .listRowBackground(Color.theme.background)
            
        }
        .listStyle(PlainListStyle())
        .transition(.move(edge: .leading))
    }
    
    // Portfolio coin list
    private var portfolioCoinList: some View {
        List {
            ForEach(homeViewModel.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 5))
            }
            .listRowBackground(Color.theme.background)
            
        }
        .listStyle(PlainListStyle())
        .transition(.move(edge: .trailing))
    }
        
    // Column titles
    private var columnTitles: some View {
        HStack{
            Text("Coin")
                .frame(width: UIScreen.main.bounds.width / 4 )
            Spacer()
            if showPortfolio {
                Text("Holding")
                    .frame(width: UIScreen.main.bounds.width / 4 )
            }
            
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 4 )
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
