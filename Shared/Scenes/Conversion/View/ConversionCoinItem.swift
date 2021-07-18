//
//  ConversionCoinItem.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import SwiftUI
import Kingfisher

struct ConversionCoinItem : View {
    
    var coinItem : CoinDataModel? = nil
    
    var selectedCoinItem : CoinDataModel? = nil
    
    var body: some View {
        
        VStack {
            
            VStack{
                
                KFImage(URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(coinItem!.id!.toString()).png")!)
                    .resizable()
                    .cancelOnDisappear(true)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: isSelected() ? 35 : 25, height: isSelected() ? 35 : 25)
                    .clipShape(Circle())
                
                Text(coinItem!.symbol!)
                    .foregroundColor(isSelected() ? Color.orange : Color.primary)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .frame(minWidth:50)
                    .padding(.top,5)
                
                Text(coinItem!.quote!.usd!.price!.toFormatter())
                    .foregroundColor(coinItem!.quote!.usd!.percentChange1H! > 0 ? Color.green : Color.red)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .font(.system(size: 9))
                    .padding(.top, 0.2)
                
            }
            .padding(.top, isSelected() ? 45 : 30)
            .padding(.bottom, isSelected() ? 45 : 30)
            .padding(.leading,10)
            .padding(.trailing,10)
            
        }
        .overlay(RoundedRectangle(cornerRadius: 48)
                    .stroke(getSelectBackground(), lineWidth: 2))
        .shadow(radius: 0)
        .padding(.top, 25)
        .padding(.bottom, 25)
        .padding(.trailing, 3)
        .padding(.leading, 15)
    }
    
    func isSelected() -> Bool {
        
        print("thisId: \(String(describing: self.coinItem?.id?.toString()))   -----    selectId: \(String(describing: self.selectedCoinItem?.id))")
        
        if self.coinItem?.id == self.selectedCoinItem?.id {
            return true
        }
        
        return false
    }
    
    func getSelectBackground() -> Color {
        
        if isSelected() {
            return Color.orange
        }
        
        return Color.secondary
    }
}

struct ConversionCoinItem_Previews : PreviewProvider {
    static var previews: some View{
        ConversionCoinItem(coinItem: CoinDataModel(id: 1, name: "Bitcoin", symbol: "BTC", slug: "BTC", numMarketPairs: 1, dateAdded: "10.10.2010", tags: ["btc","coin"], maxSupply: 1, circulatingSupply: 1.0, totalSupply: 1.0, platform: Platform(id: 1, name: Name(rawValue: "Btc"), symbol: Symbol(rawValue: "btc"), slug: Slug(rawValue: "btc"), tokenAddress: "btc.com"), cmcRank: 1, lastUpdated: "10.10.2021", quote: Quote(usd: Usd(price: 33.000, volume24H: 22.0, percentChange1H: 1.0, percentChange24H: 1.0, percentChange7D: 1.0, percentChange30D: 1.0, percentChange60D: 1.0, percentChange90D: 1.0, marketCap: 1.0, lastUpdated: "01.01.2021"))))
            .previewLayout(.sizeThatFits)
    }
}
