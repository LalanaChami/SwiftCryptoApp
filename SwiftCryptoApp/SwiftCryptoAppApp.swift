//
//  SwiftCryptoAppApp.swift
//  SwiftCryptoApp
//
//  Created by Lalana Chamika on 2023-11-11.
//

import SwiftUI

@main
struct SwiftCryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().navigationBarHidden(true)
            }
        }
    }
}
