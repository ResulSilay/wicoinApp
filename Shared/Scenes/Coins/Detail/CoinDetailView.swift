//
//  CoinDetailView.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import SwiftUI
import Kingfisher

struct CoinDetailView : View {
    
    @StateObject var viewModel = CoinDetailViewModel()
    
    @State var coinId: Int? = nil
    
    @State var coinUsdPrice: Double? = nil
    
    @State var percentChange1H: Double? = nil
    
    var body: some View{
        
        ScrollView(showsIndicators: false) {
            
            LazyVStack(alignment: .leading){
                
                HStack(alignment: .center){
                    
                    KFImage(URL(string: viewModel.data?.logo?.toString() ?? ""))
                        .cancelOnDisappear(true)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading){
                        
                        Text(self.coinUsdPrice?.toFormatter() ?? "-")
                            .foregroundColor(self.percentChange1H! > 0 ? Color.green : Color.red)
                            .font(.system(size: 21))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text(viewModel.data?.dateAdded?.toString() ?? "-")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                            .padding(.top, 0.1)
                        
                    }
                }.padding(.bottom, 20)
                
                Text(viewModel.data?.description?.toString() ?? "")
                
                VStack(alignment:.leading){
                    
                    ForEach(viewModel.data?.urls?.website ?? [], id: \.self){ item in
                        Button(action: {}, label: {
                            Text(item)
                                .lineLimit(1)
                        })
                        Divider()
                    }
                    
                    ForEach(viewModel.data?.urls?.chat ?? [], id: \.self){ item in
                        Button(action: {}, label: {
                            Text(item)
                                .lineLimit(1)
                        })
                        Divider()
                    }
                    
                    ForEach(viewModel.data?.urls?.technicalDoc ?? [], id: \.self){ item in
                        Button(action: {}, label: {
                            Text(item)
                                .lineLimit(1)
                        })
                        Divider()
                    }
                    
                    ForEach(viewModel.data?.urls?.explorer ?? [], id: \.self){ item in
                        Button(action: {}, label: {
                            Text(item)
                                .lineLimit(1)
                        })
                        Divider()
                    }
                    
                    ForEach(viewModel.data?.urls?.reddit ?? [], id: \.self){ item in
                        Button(action: {}, label: {
                            Text(item)
                                .lineLimit(1)
                        })
                        Divider()
                    }
                    
                    FlowLayoutView(mode: .scrollable,
                                   binding: .constant(5),
                                   items: (self.viewModel.data?.tags) ?? []) {
                        Text($0)
                            .font(.system(size: 12))
                            .foregroundColor(Color.primary)
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 48)
                                            .foregroundColor(Color.primary.opacity(0.2)))
                    }
                    .padding(.top, 15)
                }
                .padding(.top, 15)
                
            }
            .padding(15)
        }
        .redacted(reason: viewModel.isLoading ? . placeholder : [])
        .onAppear(perform: {
            viewModel.getInfo(id: coinId!)
        })
        
        .navigationBarTitle(viewModel.data?.name?.toString() ?? "-", displayMode: .large)
    }
}


struct CoinDetailView_Previews : PreviewProvider {
    
    static var previews: some View {
        
        CoinDetailView()
    }
}
