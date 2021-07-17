//
//  NewsService.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 17.07.2021.
//

import Foundation

protocol NewsService {
    
    func getArchive(query: String,
                    success: @escaping (NewsArchiveResponse)->Void,
                    failure: @escaping ()->Void,
                    loading: @escaping ()->Void,
                    finish: @escaping ()->Void)
    
}
