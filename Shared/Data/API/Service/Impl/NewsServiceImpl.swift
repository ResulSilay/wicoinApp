//
//  NewsArchiveImpl.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 17.07.2021.
//

import Foundation

class NewsServiceImpl: NewsService {
    
    func getArchive(query: String, success: @escaping (NewsArchiveResponse) -> Void, failure: @escaping () -> Void, loading: @escaping () -> Void, finish: @escaping () -> Void) {
        
        loading()
        
        ApiClient.shared.fetch(
            baseUrl: BaseUrls.NEWS,
            headers: ApiHeaders.shared.coinNewsHeaders(),
            httpMethod: HttpMethod.GET,
            url: "api/1/news?q=\(query)",
            
            success: { NewsArchiveResponse in
                success(NewsArchiveResponse)
                
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
