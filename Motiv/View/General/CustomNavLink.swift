//
//  CustomNavLink.swift
//  Motiv
//
//  Created by William Little on 2022-04-26.
//

import SwiftUI

struct CustomNavLink: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 75.5)
                .foregroundColor(Color("LightBlue"))
            Rectangle()
                .foregroundColor(Color("DarkBlue"))
                .frame(height: 75)
                .ignoresSafeArea()
            
            HStack {
                Image("CAP")
                    .resizable()
                    .frame(width: 35, height: 20)
                Text("Select School")
                    .foregroundColor(Color("LightBlue"))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 10, height: 20)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(Color("LightBlue"))
            }
            .padding(.horizontal)
        }
    }
}

struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavLink()
    }
}
