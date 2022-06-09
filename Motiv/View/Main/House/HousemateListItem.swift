//
//  HousemateListItem.swift
//  Motiv
//
//  Created by Thavish Perera on 2022-06-09.
//

import SwiftUI

struct HousemateListItem: View {
    let user: User
    @State private var areFriends = false //TODO: Get friend status from db

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.profilePhoto)) { phase in
                if let image = phase.image {
                    image.resizable()
                } else {
                    Image(systemName: "person")
                }
            }
            .frame(width: 40, height: 40)
            .background(.clear)
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(.white))
            
            VStack(alignment: .leading) {
                Text(user.name)
                Text("@\(user.username)")
                    .font(.caption)
                    .foregroundColor(Color("OnboardingCaption"))
            }
            
            Spacer()
            
            //TODO: Attempt to change friend status then update button. May require 3rd button state for 'pending' in future
            Button { areFriends.toggle() } label: {
                Text(areFriends ? "Friends" : "Add Friend")
            }
            .font(.body.bold())
            .foregroundColor(areFriends ? .white : .blue)
            .padding(.vertical, 5)
            .frame(width: 125)
            .overlay( areFriends ? nil :
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
            )
            .background(areFriends ? .blue : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .foregroundColor(.white)
    }
}

struct HousemateListItem_Previews: PreviewProvider {
    static let user = IndexingViewModel().dummyUsers[0]
    static var previews: some View {
        HousemateListItem(user: user)
    }
}
