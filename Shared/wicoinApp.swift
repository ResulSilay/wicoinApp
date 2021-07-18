//
//  wicoinApp.swift
//  Shared
//
//  Created by Resul Silay on 15.07.2021.
//

import SwiftUI

@main
struct wicoinApp: App {
    
    init() {
        let apiContainer = ApiContainer.shared.buid()
        Resolver.shared.setDependencyContainer(apiContainer)
        print("API services inject ok.")
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
