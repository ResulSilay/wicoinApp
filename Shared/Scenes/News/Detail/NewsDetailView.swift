//
//  NewsDetailView.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 17.07.2021.
//

import SwiftUI
import Kingfisher

struct NewsDetailView : View {
    
    @State var newsArchive: NewsArchiveModel? = nil
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            LazyVStack(alignment: .leading) {
                
                KFImage(URL(string: newsArchive!.imageURL?.toString() ?? ""))
                    .resizable()
                    .cancelOnDisappear(true)
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .background(Color.secondary)
                    .cornerRadius(0.0)
                
                VStack(alignment: .leading){
                    Text(newsArchive?.title ?? "")
                        .foregroundColor(Color.orange)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                    
                    HStack{
                        
                        Text(newsArchive?.creator?.string() ?? "")
                            .foregroundColor(Color.secondary)
                            .font(.system(size: 15))
                            .fontWeight(.none)
                            .padding(.top, 1)
                            .padding(.bottom, 10)
                        
                        Spacer()
                        
                        Text(newsArchive?.pubDate ?? "")
                            .foregroundColor(Color.secondary)
                            .font(.system(size: 13))
                            .fontWeight(.none)
                            .padding(.top, 1)
                            .padding(.bottom, 10)
                    }
                    
                    Text(newsArchive?.content ?? "")
                        .foregroundColor(Color.primary)
                    
                    HStack {
                        
                        FlowLayoutView(mode: .scrollable,
                                       binding: .constant(5),
                                       items: (self.newsArchive?.keywords) ?? []) {
                            Text($0)
                                .font(.system(size: 12))
                                .foregroundColor(Color.primary)
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 48)
                                                .foregroundColor(Color.primary.opacity(0.2)))
                        }
                    }
                    .padding(.top, 10)
                    
                }
                .padding()
            }
            .frame(maxWidth:.infinity)
        }
        .navigationBarTitle(Text(newsArchive?.title?.toString() ?? ""), displayMode: .large)
    }
}

struct NewsDetailView_Previews : PreviewProvider {
    static var previews: some View{
        NewsDetailView(newsArchive: NewsMock().mock())
            .previewLayout(.sizeThatFits)
    }
}
