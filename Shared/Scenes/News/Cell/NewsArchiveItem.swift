//
//  NewsItemView.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 17.07.2021.
//

import SwiftUI
import Kingfisher

struct NewsArchiveItem : View {
    
    @State var archiveItem : NewsArchiveModel? = nil
    
    var body: some View {
        
        VStack {
            
            HStack{
                
                KFImage(URL(string: archiveItem!.imageURL?.toString() ?? ""))
                    .resizable()
                    .cancelOnDisappear(true)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .background(Color.secondary)
                    .cornerRadius(8.0)
                
                VStack(alignment: .leading, spacing: 2){
                    
                    Text(archiveItem!.title?.toString() ?? "")
                        .foregroundColor(Color.primary)
                        .fontWeight(.bold)
                        .lineLimit(1)
                    
                    Text(archiveItem!.description?.toString() ?? "")
                        .foregroundColor(Color.primary)
                        .font(.system(size: 14))
                        .fontWeight(.none)
                        .lineLimit(1)
                    
                    Text(archiveItem!.creator?.string() ?? "")
                        .foregroundColor(Color.secondary)
                        .font(.system(size: 12))
                        .fontWeight(.none)
                        .padding(.top,10)
                    
                    Text(archiveItem!.pubDate!)
                        .foregroundColor(Color.secondary)
                        .font(.system(size: 10))
                        .fontWeight(.none)
                        .padding(.top, 5)
                }
                .padding(.leading,5)
                .padding(.trailing,5)
                
            }
            .padding(.top,10)
            .padding(.bottom,10)
            .padding(.leading,0)
            .padding(.trailing,0)
            
        }
    }
}

struct NewsArchiveItem_Previews : PreviewProvider {
    static var previews: some View{
        NewsArchiveItem(archiveItem: NewsArchiveModel(title: "Cardano is outstripping ....", link: "https://", keywords: ["",""], creator: ["Bitcoin.com"], videoURL: "https://", description: "Cardona.........", content: "content", pubDate: "01.01.2020 20:20", imageURL: "https://", sourceID: "23492-dfjsd-98723-sdf888"))
            .previewLayout(.sizeThatFits)
    }
}
