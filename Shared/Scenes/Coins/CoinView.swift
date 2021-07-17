//
//  DashboardView.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 15.07.2021.
//

import SwiftUI
import Kingfisher

struct CoinView : View {
    
    @StateObject var viewModel = CoinViewModel()
    
    var body: some View {
        
        NavigationView{
            
            List(viewModel.coins) { coin in
                
                NavigationLink(
                    destination: CoinDetailView(coinId: coin.id!, coinUsdPrice: coin.quote?.usd?.price, percentChange1H: coin.quote?.usd?.percentChange1H),
                    label: {
                        CoinCellView(coin: coin)
                    })
                    .disabled(viewModel.isLoading)
            }
            .listStyle(PlainListStyle())
            .redacted(reason: viewModel.isLoading ? . placeholder : [])
            .onAppear(perform:
                        viewModel.getLatestCoins
            )
            
            .navigationBarTitle("Coins", displayMode: .large)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {}) {
                        KFImage(URL(string: "https://generated.photos/vue-static/home/hero/3.png")!)
                            .cancelOnDisappear(true)
                            .frame(width: 25, height: 25)
                            .clipShape(Circle())
                        
                    }
                }
            }
            
        }
        
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View{
        CoinView()
    }
}
