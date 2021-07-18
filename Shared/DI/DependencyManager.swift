//
//  DependencyManager.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 18.07.2021.
//

import Foundation
import Swinject

@propertyWrapper
struct Inject<Component> {
    
    let wrappedValue: Component
    
    init() {
        self.wrappedValue = Resolver.shared.resolve(Component.self)
    }
}
