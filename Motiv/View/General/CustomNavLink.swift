//
//  CustomNavLink.swift
//  Motiv
//
//  Created by William Little on 2022-04-26.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomNavLink: View {
    
    @Binding var housemates: [User]
    @State var counter = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 75.5)
                .foregroundColor(Color("LightBlue"))
            Rectangle()
                .foregroundColor(Color("DarkBlue"))
                .frame(height: 75)
                .ignoresSafeArea()
            
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "person.3")
                    .resizable()
                    .foregroundColor(Color("LightBlue"))
                    .frame(width: 35, height: 18)
                    .padding(.horizontal)
                
                if self.housemates.isEmpty {
                    Text("Add Housemates")
                        .foregroundColor(Color("LightBlue"))
                        .padding(.horizontal, 5)
                        .multilineTextAlignment(.leading)
                } else {
                    
                    ZStack {
                        // MARK: Iteration using integers for offset values
                        ForEach(0...housemates.count - 1, id: \.self) { num in
                            WebImage(url: URL(string: housemates[num].profilePhoto))
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 30, height: 30)
                                .offset(x: CGFloat(num * 20))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    // MARK: Plus others housemate in case of more than 1
                    if housemates.count == 1 {
                        Text("\(housemates[0].name) + \(housemates.count - 1) others")
                            .foregroundColor(Color("LightGray"))
                            .font(.footnote)
                            .frame(maxWidth: .infinity)
                    } else if housemates.count == 2 {
                        Text("\(housemates[0].name) + 1 other")
                            .foregroundColor(Color("LightGray"))
                            .font(.footnote)
                            .frame(maxWidth: .infinity)
                    } else {
                        Text("\(housemates[0].name) + \(housemates.count - 1) others")
                            .foregroundColor(Color("LightGray"))
                            .font(.footnote)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 10, height: 20)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(Color("LightBlue"))
                    .padding(.horizontal, 5)
            }
            .padding(.horizontal)
        }
    }
}

