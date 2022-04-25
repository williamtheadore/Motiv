//
//  CircleLogoView.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI

struct CircleLogoView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(Color("BG"))
            Circle()
                .frame(width: 105, height: 105)
                .foregroundColor(Color("CircleBorder"))
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color("BG"))
                .shadow(color: Color.white.opacity(0.5), radius: 6, x: 0, y: 3)
            Image("WhiteLogo")
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}

struct CircleLogoView_Previews: PreviewProvider {
    static var previews: some View {
        CircleLogoView()
    }
}
