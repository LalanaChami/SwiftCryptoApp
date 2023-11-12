//
//  HomeViewModel.swift
//  SwiftCryptoApp
//
//  Created by Lalana Chamika on 2023-11-12.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinEntity] = []
    @Published var portfolioCoins: [CoinEntity] = []

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)

        })
        
    }
}
