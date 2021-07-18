//
//  ConversionViewModel.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import Foundation

class ConversionViewModel: ObservableObject {
    
    private var conversionService = ConversionServiceImpl()
    
    private let cryptoService = CryptoServiceImpl()
    
    @Published var conversionResult : ConversionDataModel? = nil
    
    @Published var coins = [CoinDataModel]()
    
    @Published var isLoading : Bool = false
    
    func convert(conversionRequest: ConversionRequest){
        
        DispatchQueue.main.async {
            
            self.conversionService.convert(request: conversionRequest) { ConversionResultResponse in
                self.conversionResult = ConversionResultResponse.data
                
            } failure: {
                
            } loading: {
                self.isLoading.toggle()
                
            } finish: {
                self.isLoading.toggle()
            }
        }
    }
    
    func getCoins(){
        
        DispatchQueue.main.async {
            
            self.cryptoService.getLatestAllCoin(success: { CoinLatestResponse in
                self.coins = CoinLatestResponse.data!
                
            }, failure: {
                
            }, loading: {
                
                self.isLoading.toggle()
                
            }, finish: {
                
                self.isLoading.toggle()
                
            })
        }
    }
}
