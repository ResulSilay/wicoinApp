//
//  ImageLoader.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import SwiftUI

let imageCache = NSCache<AnyObject, AnyObject>()

final class ImageLoader: ObservableObject {
  private var task: URLSessionDataTask?

  @Published var data: Data?

  init(_ url: URL) {
    task = URLSession.shared.dataTask(with: url) { data, _, _ in
      if let data = data, let imageToCache = UIImage(data: data) {
        imageCache.setObject(imageToCache, forKey: url as AnyObject)
      }
      DispatchQueue.main.async { self.data = data }
    }
    task?.resume()
  }

  deinit {
    task?.cancel()
  }
}
