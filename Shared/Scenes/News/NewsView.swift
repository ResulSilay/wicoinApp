//
//  NewsView.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import SwiftUI

struct NewsView : View {
    
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                List(viewModel.newsArchives){ archive in
                    
                    NavigationLink(
                        destination: NewsDetailView(newsArchive: archive),
                        label: {
                            NewsArchiveItem(archiveItem: archive)
                        })
                        .disabled(viewModel.isLoading)
                }
                .listStyle(PlainListStyle())
                .redacted(reason: viewModel.isLoading ? . placeholder : [])
                .onAppear(perform: {
                    viewModel.getArchive(query: "coin")
                })
          
            }
            
            .navigationBarTitle("News",displayMode: .large)
        }
    }
}


struct NewsView_Previews : PreviewProvider {
    static var previews: some View{
        NewsView()
    }
}
