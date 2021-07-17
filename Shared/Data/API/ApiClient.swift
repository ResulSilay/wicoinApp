//
//  ApiClient.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 15.07.2021.
//

import Foundation

class ApiClient {
    
    static var shared = ApiClient()
    
    private var contentType = "application/json; charset=utf-8"
    
    func fetch<T:Decodable>(baseUrl: BaseUrls,
                          headers: [Headers],
                          httpMethod: HttpMethod,
                          url: String,
                          success: @escaping (T) -> Void,
                          failure: @escaping (_ error: String)->Void,
                          completed: @escaping ()->Void)
    {
        
        let url = URL(string: "\(baseUrl.rawValue)/\(url)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        headers.forEach { headers in
            request.setValue(headers.value, forHTTPHeaderField: headers.key)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                
                do {
                    
                    let response = try JSONDecoder().decode(T.self, from: data)
                    success(response)
                    
                } catch let error {
                    failure(error.localizedDescription)
                }
                
            } else {
                
                failure("nil")
            }
            
            completed()
            
        }
        
        task.resume()
    }
    
}

enum HttpMethod : String {
    case GET = "GET"
    case POST = "POST"
}
