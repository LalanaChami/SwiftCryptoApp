//
//  CircleButtionView.swift
//  SwiftCryptoApp
//
//  Created by Lalana Chamika on 2023-11-11.
//

import SwiftUI

struct CircleButtionView: View {
    
    let iconName: String;
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50 , height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group{
        CircleButtionView(iconName: "info").colorScheme(.light)
        CircleButtionView(iconName: "plus").colorScheme(.dark)
    }
}
