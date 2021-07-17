//
//  ContentView.swift
//  Shared
//
//  Created by Resul Silay on 15.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView{
        
            DashboardView()
                .tabItem {
                    Image(systemName: "house")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
