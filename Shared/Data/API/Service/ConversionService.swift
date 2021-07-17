//
//  ConversionService.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import Foundation

protocol ConversionService {
    
    func convert(request: ConversionRequest,
                 success: @escaping (ConversionResultResponse)->Void,
                 failure: @escaping ()->Void,
                 loading: @escaping ()->Void,
                 finish: @escaping ()->Void)
}
