//
//  ApiContainer.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 18.07.2021.
//

import Swinject

class ApiContainer {
    
    static var shared = ApiContainer()
    
    func buid() -> Container {
        
        let container = Container()
        
        container.register(CryptoService.self) { _  in
            return CryptoServiceImpl()
        }
        
        container.register(ConversionService.self) { _  in
            return ConversionServiceImpl()
        }
        
        container.register(NewsService.self) { _  in
            return NewsServiceImpl()
        }
        
        return container
    }
    
}
