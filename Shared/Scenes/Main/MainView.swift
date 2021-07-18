//
//  ContentView.swift
//  Shared
//
//  Created by Resul Silay on 15.07.2021.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        TabView{
            
            CoinView()
                .tabItem {
                    Image(systemName: "bitcoinsign.circle")
                    Text("Coins")
                }
            
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
            
            ConversionView()
                .tabItem {
                    Image(systemName: "arrow.triangle.2.circlepath")
                    Text("Conversion")
                }
        }
        .accentColor(.orange)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
