//
//  Resolver.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 18.07.2021.
//

import Swinject

class Resolver {
    
    static let shared = Resolver()
    
    private var container = ApiContainer.shared.buid()

    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }

    func setDependencyContainer(_ container: Container) {
        self.container = container
    }
}
