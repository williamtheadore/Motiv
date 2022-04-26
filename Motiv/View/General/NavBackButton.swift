//
//  NavBackButton.swift
//  Motiv
//
//  Created by William Little on 2022-04-26.
//

import SwiftUI

struct NavBackButton: View {
    var body: some View {
        Image(systemName: "chevron.left")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 13, height: 24)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            .padding(.vertical)
    }
}

struct NavBackButton_Previews: PreviewProvider {
    static var previews: some View {
        NavBackButton()
    }
}
