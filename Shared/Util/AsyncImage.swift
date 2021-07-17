//
//  AsyncImage.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import SwiftUI

struct AsyncImage : View {

    var imageUrl: URL

    private var image: UIImage {
        imageLoader.image(for: imageUrl)
    }

    @ObjectBinding private var imageLoader: ImageLoader

    init(url: URL) {
        self.imageUrl = url
        self.imageLoader = ImageLoader()
    }

    var body: some View {
        Image(uiImage: image)
            .frame(width: 200, height: 300)
            .aspectRatio(contentMode: ContentMode.fit)
    }
}
