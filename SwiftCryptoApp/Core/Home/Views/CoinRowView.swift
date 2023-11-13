//
//  CoinRowView.swift
//  SwiftCryptoApp
//
//  Created by Lalana Chamika on 2023-11-12.
//

import SwiftUI

struct CoinRowView: View {

    let coin: CoinEntity
    let showHoldingsColumn: Bool

    var body: some View {
        HStack  {
            leftCol
            
            Spacer()
            if showHoldingsColumn {
                centerCol
            }
            Spacer()
            
            rightCol
            
            .frame(width: UIScreen.main.bounds.width / 4 )
        }.background(Color.theme.background)
        
    }
}


struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View{
        Group {
            
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
        }
    }
}

extension CoinRowView {
    private var leftCol : some View {
        HStack (spacing: 0) {
            Text("\(coin.rank)")
                .font(.subheadline)
                .foregroundColor(Color.theme.accent)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 35, height: 35)
            VStack(alignment: .leading) {
                Text(coin.symbol.uppercased())
                    .font(.subheadline)
                    .bold()
                    .padding(.leading, 4)
                    .foregroundColor(Color.theme.accent)
//                if !showHoldingsColumn {
                    Text(coin.name)
                    .font(.caption)
                        .padding(.leading, 4)
                        .foregroundColor(Color.theme.accent)
//                }
                
            }
        }
    }
    
    private var centerCol: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingValue.asCurrencyWith6Decimal())
                .font(.subheadline)
            Text((coin.currentHoldings ?? 0).numAsString())
                .font(.subheadline)
        }
    }
    
    private var rightCol: some View {
        VStack (alignment: .trailing){
            Text(coin.currentPrice.asCurrencyWith6Decimal())
                .font(.subheadline)
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChange24H?.asPercentString() ?? "")
                .font(.subheadline)
                .foregroundColor(
                    (coin.priceChange24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
    }
}
