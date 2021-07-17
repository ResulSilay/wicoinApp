//
//  NewsViewModel.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 17.07.2021.
//

import Foundation


class NewsViewModel: ObservableObject {
    
    private var newsService = NewsServiceImpl()
    
    @Published var newsArchives = [NewsArchiveModel]()
    
    @Published var isLoading : Bool = false
    
    func getArchive(query: String){
        
        DispatchQueue.main.async {
            
            self.newsService.getArchive(query: query) { NewsArchiveResponse in
                self.newsArchives = NewsArchiveResponse.results!
                
            } failure: {
                
            } loading: {
                self.isLoading.toggle()
                
            } finish: {
                self.isLoading.toggle()
            }
        }
    }
    
}
