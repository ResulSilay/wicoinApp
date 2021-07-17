//
//  ConversionView.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import SwiftUI

struct ConversionView :View {
    
    @StateObject var viewModel = ConversionViewModel()
    
    @State var coinId : Int? = nil
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
                                        
                                        self.selectedCoinId = coin.id!
                                        print("Select coin id --> \(String(describing: self.selectedCoinId.toString()))")
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
                        .foregroundColor(Color.secondary)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(Color.secondary, lineWidth: 2.0)
                        )
                        .padding()
                    
                    Button(action: {
                        
                        viewModel.convert(conversionRequest: ConversionRequest(id: self.coinId, amount: Double(self.amount)))
                        
                    }, label: {
                        
                        Text("CONVERT")
                            .fontWeight(.bold)
                            .padding(10.0)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundColor(Color.white)
                            .background(Color.secondary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.0)
                                    .stroke(lineWidth: 0.0)
                                    .foregroundColor(Color.secondary)
                            )
                        
                    })
                    .padding(.top,5)
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    
                    
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
