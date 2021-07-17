//
//  ConversionService.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import Foundation

class ConversionServiceImpl : ConversionService {
    
    func convert(request: ConversionRequest, success: @escaping (ConversionResultResponse) -> Void, failure: @escaping () -> Void, loading: @escaping () -> Void, finish: @escaping () -> Void) {
        
        loading()
        
        ApiClient.shared.fetch(
            baseUrl: BaseUrls.COIN,
            headers: ApiHeaders.shared.coinDataHeaders(),
            httpMethod: HttpMethod.GET,
            url: "v1/tools/price-conversion?id=\(request.id?.toString() ?? "")&amount=\(request.amount?.toString() ?? "")",
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
}
