//
//  ConversionView.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import SwiftUI
import Kingfisher

struct ConversionView :View {
    
    @StateObject var viewModel = ConversionViewModel()
    
    @State var coinSourceItem : CoinDataModel? = nil
    @State var coinTargetItem : CoinDataModel? = nil
    @State var amount : String = ""
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                LazyVStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack{
                            
                            ForEach(viewModel.coins) { coin in
                                
                                ConversionCoinItem(coinItem: coin, selectedCoinItem: self.coinSourceItem)
                                    .disabled(viewModel.isLoading)
                                    .onTapGesture {
                                        self.coinSourceItem = coin
                                    }
                            }
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack{
                            
                            ForEach(viewModel.coins) { coin in
                                
                                ConversionCoinItem(coinItem: coin, selectedCoinItem: self.coinTargetItem)
                                    .disabled(viewModel.isLoading)
                                    .onTapGesture {
                                        self.coinTargetItem = coin
                                    }
                            }
                            
                        }
                    }
                    
                }
                .padding(.top,15)
                
                Spacer(minLength: 40)
                
                TextField("Enter Amount", text: self.$amount)
                    .foregroundColor(Color.primary)
                    .padding()
                    .keyboardType(.numberPad)
                    .overlay(
                        RoundedRectangle(cornerRadius: 36.0)
                            .stroke(Color.secondary, lineWidth: 2.0)
                    )
                    .multilineTextAlignment(.trailing)
                    .padding()
                
                Button(action: {
                    
                    viewModel.convert(conversionRequest: ConversionRequest(id: self.coinSourceItem?.id,
                                                                           convertId: self.coinTargetItem?.id,
                                                                           amount: Double(self.amount)))
                    
                }, label: {
                    
                    Text("CONVERT")
                        .tracking(0.8)
                        .fontWeight(.bold)
                        .padding(10.0)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.white)
                        .cornerRadius(36)
                        .foregroundColor(Color.black)
                        .shadow(radius: 2)
                    
                    
                })
                .padding(.top,5)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                VStack{
                    
                    ZStack{
                        
                        VStack{
                            
                            HStack {
                                
                                if self.coinSourceItem != nil {
                                    KFImage(URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(self.coinSourceItem?.id ?? 0).png")!)
                                        .resizable()
                                        .cancelOnDisappear(true)
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                    
                                }
                                
                                if self.coinSourceItem != nil {
                                    Image(systemName: "arrow.right")
                                }
                                
                                if self.coinTargetItem != nil {
                                    KFImage(URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(self.coinTargetItem?.id ?? 0).png")!)
                                        .resizable()
                                        .cancelOnDisappear(true)
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                    
                                }
                            }
                            .padding(.bottom, 20)
                            
                            Text(viewModel.conversionResult?.quote?.coinArray[0].price?.toString() ?? "-")
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .redacted(reason: viewModel.conversionResult == nil ? .placeholder : [])
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 150)
                    .background(LinearGradient(gradient: Gradient(colors: [.red, .orange, .orange]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(16)
                    .shadow(radius: 6)
                    .padding()
                    .padding(.top, 20)
                }
            }
            
            
            .navigationBarTitle("Conversion", displayMode: .large)
        }
        .redacted(reason: viewModel.isLoading ? . placeholder : [])
        .onAppear(perform:viewModel.getCoins)
        
    }
}

struct ConversionView_Previews : PreviewProvider {
    static var previews: some View{
        ConversionView()
    }
}
