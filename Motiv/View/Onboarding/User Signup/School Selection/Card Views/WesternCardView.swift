//
//  WesternCardView.swift
//  DesignCode
//
//  Created by William Little on 2021-08-10.
//  Copyright © 2021 Meng To. All rights reserved.
//

import SwiftUI

struct WesternCardView: View {
    var body: some View {
        ZStack {
            Image("westerncampus")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(30)
                .frame(width: 300, height: 350)
                .offset(x: 0, y: -20)
                .opacity(0.5)
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("University of Western Ontario")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("London, ON")
                            .foregroundColor(Color("lightgray"))
                            .font(.system(size: 20))
                    }
                    Spacer()
                    Image("western")
                        .resizable()
                        .frame(width: 35, height: 45)
                }
                .padding()
                .offset(x: 0, y: -70)
                Text("893 Active Users")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .offset(x: -95, y: 60)
                    .font(.subheadline)
            }
        }
        .frame(width: 350, height: 300)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct WesternCardView_Previews: PreviewProvider {
    static var previews: some View {
        WesternCardView()
    }
}
