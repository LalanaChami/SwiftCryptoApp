//
//  SwiftCryptoAppApp.swift
//  SwiftCryptoApp
//
//  Created by Lalana Chamika on 2023-11-11.
//

import SwiftUI

@main
struct SwiftCryptoAppApp: App {
    
    @StateObject private var homeViewModel = HomeViewModel()
     
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().navigationBarHidden(true)
            }
            .environmentObject(homeViewModel)
        }
    }
}
