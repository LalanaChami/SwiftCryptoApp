//
//  HomeViewModel.swift
//  SwiftCryptoApp
//
//  Created by Lalana Chamika on 2023-11-12.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinEntity] = []
    @Published var portfolioCoins: [CoinEntity] = []
    private var cancellables = Set<AnyCancellable>()
    
    private let dataService = CoinDataService()

    init() {
        subscribeToResponse()
    }
    
    private func subscribeToResponse() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
