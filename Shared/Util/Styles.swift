//
//  Styles.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import SwiftUI

struct WideOrangeButton: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 0,
                   maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .background( RoundedRectangle(cornerRadius: 5.0).fill(Color.orange)
        )
    }
}
