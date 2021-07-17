//
//  DashboardViewModel.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 15.07.2021.
//

import Foundation

class CoinViewModel : ObservableObject {
    
    private let crytoService = CryptoServiceImpl()
    
    @Published var coins = [CoinDataModel]()
    
    @Published var isLoading : Bool = false
    
    func getLatestCoins(){
        
        DispatchQueue.main.async {
            
            self.crytoService.getLatestAllCoin(success: { CoinLatestResponse in
                
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
