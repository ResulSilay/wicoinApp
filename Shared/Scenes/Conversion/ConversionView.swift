//
//  ConversionView.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import SwiftUI

struct ConversionView :View {
    
    @StateObject var viewModel = ConversionViewModel()
    
    @State var coinItem : CoinDataModel? = nil
    @State var amount : String = ""
    @State var selectedCoinId : Int = 0
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack {
                    
                    ScrollView(.horizontal) {
                        
                        LazyHStack {
                            
                            ForEach(viewModel.coins) { coin in
                                
                                ConversionCoinItem(coinItem: coin,selectedItemId: self.selectedCoinId)
                                    .disabled(viewModel.isLoading)
                                    .simultaneousGesture(TapGesture().onEnded {
                                        
                                        self.coinItem = coin
                                        print("Select coin id --> \(String(describing: self.coinItem?.id?.toString()))")
                                        print("Select coin id ****--> \(String(describing: coin.id?.toString()))")
                                    })
                                
                            }
                            
                        }
                        .padding(.top,15)
                        .redacted(reason: viewModel.isLoading ? . placeholder : [])
                        .onAppear(perform:viewModel.getCoins)
                    }
                    
                    Spacer(minLength: 40)
                    
                    TextField("Enter Amount", text: self.$amount)
                        .foregroundColor(Color.white)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 36.0)
                                .stroke(Color.secondary, lineWidth: 2.0)
                        )
                        .padding()
                    
                    Button(action: {
                        
                        viewModel.convert(conversionRequest: ConversionRequest(id: self.coinItem?.id ?? 0, amount: Double(self.amount)))
                        
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
                                Text("\(self.coinItem?.symbol ?? "")  --->  \(self.coinItem?.symbol ?? "" )")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .padding(.bottom, 10)
                                
                                Text("\(viewModel.conversionResult?.quote?.coinArray[0].price ?? 0)")
                                    .fontWeight(.bold)
                                    .font(.system(size: 25))
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 150)
                        .background(LinearGradient(gradient: Gradient(colors: [.red, .orange, .orange]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(16)
                        .shadow(radius: 6)
                        .redacted(reason: viewModel.conversionResult == nil ? .placeholder : [])
                        .padding()
                        .padding(.top, 20)
                    }
                }
            }
            .onAppear(perform: {
                
            })
            
            .navigationBarTitle("Conversion", displayMode: .large)
        }
    }
}

struct ConversionView_Previews : PreviewProvider {
    static var previews: some View{
        ConversionView()
    }
}
