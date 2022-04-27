//
//  CardView.swift
//  DesignCode
//
//  Created by William Little on 2021-08-09.
//  Copyright © 2021 Meng To. All rights reserved.
//

import SwiftUI

struct QueensCardView: View {
    var body: some View {
        
        ZStack {
            Image("queenscampus")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(30)
                .frame(width: 300, height: 350)
                .offset(x: 0, y: -20)
                .opacity(0.6)
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Queen's University")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Kingston, ON")
                            .foregroundColor(Color("lightgray"))
                            .font(.system(size: 20))
                    }
                    Spacer()
                    Image("queens")
                        .resizable()
                        .frame(width: 35, height: 45)
                }
                .padding()
                .offset(x: 0, y: -85)
                Text("1304 Active Users")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .offset(x: -95, y: 70)
                    .font(.subheadline)
            }
        }
        .frame(width: 350, height: 300)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        QueensCardView()
    }
}
