//
//  UserDropDownMenu.swift
//  Motiv
//
//  Created by Thavish Perera on 2022-05-31.
//

import SwiftUI

struct UserDropDownMenu: View {
    // TODO: Replace this with actual data
    @State private var users = IndexingViewModel().dummyUsers

    var body: some View {
        VStack {
            Button {} label: {
                Image(systemName: "chevron.down")
                    .font(.system(size: 40, weight: .thin))
            }
            .padding(.top)

            VStack(alignment: .leading) {
                ForEach(users, id: \.id) { user in
                    HStack(spacing: 10) {
                        AsyncImage(url: URL(string: user.profilePhoto)) { phase in
                            if let image = phase.image {
                                image.resizable()
                            } else {
                                Color.white
                            }
                        }
                        .frame(width: 40, height: 40)
                        .background(.clear)
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.white))

                        Text(user.name)
                            .font(.title3.weight(.light))
                        Spacer()
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: 275)
        .foregroundColor(.white)
        .background(Color("OnboardingCaption"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

struct UserDropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        UserDropDownMenu()
    }
}
