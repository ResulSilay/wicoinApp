//
//  CryptoRepository.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 15.07.2021.
//

import Foundation

class CryptoServiceImpl : CryptoService {
    
    func getLatestAllCoin(success: @escaping (CoinLatestResponse)->Void,
                          failure: @escaping ()->Void,
                          loading: @escaping ()->Void,
                          finish: @escaping ()->Void){
        
        
        loading()
        
        ApiClient.shared.fetch(
            baseUrl: BaseUrls.COIN,
            headers: ApiHeaders.shared.coinDataHeaders(),
            httpMethod: HttpMethod.GET,
            url: "v1/cryptocurrency/listings/latest",
            success: { CoinLatestResponse in
                success(CoinLatestResponse)
                
            }, failure: {error in
                print("Error: \(error)")
                failure()
                
            }, completed: {
                print("Completred:")
                finish()
            }
        )
    }
    
    func getInfo(id: Int,
                 success: @escaping (CoinInfoResponse)->Void,
                 failure: @escaping ()->Void,
                 loading: @escaping ()->Void,
                 finish: @escaping ()->Void){
        
        
        loading()
        
        ApiClient.shared.fetch(
            baseUrl: BaseUrls.COIN,
            headers: ApiHeaders.shared.coinDataHeaders(),
            httpMethod: HttpMethod.GET,
            url: "v1/cryptocurrency/info?id=\(id)",
            success: { CoinInfoResponse in
                
                success(CoinInfoResponse)
                
            }, failure: {error in
                print("Error(Info): \(error)")
                failure()
                
            }, completed: {
                finish()
            }
        )
    }
    
}
