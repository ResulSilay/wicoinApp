//
//  CoinDetailViewModel.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import Foundation

class CoinDetailViewModel: ObservableObject {
    
    @Published var data : CoinInfoModel? = nil
    
    @Published var isLoading: Bool = false
    
    private var cryptoService = CryptoServiceImpl()
    
    func getInfo(id: Int){
        
        cryptoService.getInfo(id: id) { CoinInfoResponse in
            
            self.data = CoinInfoResponse.data?.coinArray[0]
            
        } failure: {
            
        } loading: {
            
            self.isLoading.toggle()
            
        } finish: {
            
            self.isLoading.toggle()
        }
    }
    
}
