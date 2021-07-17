//
//  CryptoService.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import Foundation

protocol CryptoService {
    
    func getLatestAllCoin(success: @escaping (CoinLatestResponse)->Void,
                          failure: @escaping ()->Void,
                          loading: @escaping ()->Void,
                          finish: @escaping ()->Void)
    
    func getInfo(id: Int, success: @escaping (CoinInfoResponse)->Void,
                          failure: @escaping ()->Void,
                          loading: @escaping ()->Void,
                          finish: @escaping ()->Void)
        
}
