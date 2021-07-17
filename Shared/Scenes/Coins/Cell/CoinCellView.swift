//
//  CoinCellView.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import SwiftUI
import Kingfisher

struct CoinCellView : View {
    
    @State var coin : CoinDataModel
    
    var body: some View{
        HStack{
            KFImage(URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(coin.id!).png")!)
                .resizable()
                .cancelOnDisappear(true)
                .aspectRatio(contentMode: .fill)
                .frame(width: 25, height: 25)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 3){
                Text(coin.name!)
                    .fontWeight(.bold)
                Text(coin.symbol!)
                    .foregroundColor(.secondary)
            }
            .padding(.leading,10)
            .padding(.trailing,10)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2){
                Text(coin.quote!.usd!.price!.toFormatter())
                    .foregroundColor(coin.quote!.usd!.percentChange1H! > 0 ? Color.green : Color.red)
                    .fontWeight(.bold)
                Text(coin.quote!.usd!.percentChange1H!.toRoundFormatter(toPlaces: 4).toString())
                    .foregroundColor(coin.quote!.usd!.percentChange1H! > 0 ? Color.green : Color.red)
            }
        }
        .padding(.top,10)
        .padding(.bottom,10)
        
    }
}

struct CoinCellViewPreviews : PreviewProvider {
    static var previews: some View{
        CoinCellView(coin: CoinDataModel(id: 1, name: "Bitcoin", symbol: "Btc", slug: "BTC", numMarketPairs: 1, dateAdded: "10.10.2010", tags: ["btc","coin"], maxSupply: 1, circulatingSupply: 1.0, totalSupply: 1.0, platform: Platform(id: 1, name: Name(rawValue: "Btc"), symbol: Symbol(rawValue: "btc"), slug: Slug(rawValue: "btc"), tokenAddress: "btc.com"), cmcRank: 1, lastUpdated: "10.10.2021", quote: Quote(usd: Usd(price: 33.000, volume24H: 22.0, percentChange1H: 1.0, percentChange24H: 1.0, percentChange7D: 1.0, percentChange30D: 1.0, percentChange60D: 1.0, percentChange90D: 1.0, marketCap: 1.0, lastUpdated: "01.01.2021"))))
            .previewLayout(.sizeThatFits)
        
    }
}
