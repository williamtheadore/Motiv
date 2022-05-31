//
//  HosteeView.swift
//  Motiv
//
//  Created by Thavish Perera on 2022-05-31.
//

import SwiftUI

struct HosteeView: View {
    // TODO: Populate this from incoming House struct
    @State private var houseMembers = IndexingViewModel().dummyUsers[0 ..< 6]

    @State private var houseSelected = false
    // TODO: Modify count to get count of house members
    // TODO: Also possibly modify this array so that it is more easily linked to the house members
    @State private var selectedMembers = Array(repeating: false, count: IndexingViewModel().dummyUsers[0 ..< 6].count)

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Hostee")
                .font(.title2)
                .foregroundColor(Color("OnboardingCaption"))

            HStack {
                Text("79 Nelly") // TODO: Get name from house struct
                    .font(.title.weight(.medium))
                    .foregroundColor(Color("LightBlue"))

                Spacer()

                Button {
                    houseSelected.toggle()
                    selectedMembers = selectedMembers.map { _ in houseSelected }
                } label: {
                    Circle()
                        .strokeBorder(.white)
                        .background(Circle().fill(houseSelected ? Color("LightBlue") : .clear))
                        .frame(width: 40, height: 40)
                }
            }
            .padding(.bottom, 10)

            ForEach(Array(houseMembers.enumerated()), id: \.element.id) { index, member in
                HStack {
                    AsyncImage(url: URL(string: member.profilePhoto)) { phase in
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

                    VStack(alignment: .leading) {
                        Text(member.name)
                        Text("@\(member.username)")
                            .font(.caption)
                            .foregroundColor(Color("OnboardingCaption"))
                    }

                    Spacer()

                    Button {
                        selectedMembers[index].toggle()
                    } label: {
                        Circle()
                            .strokeBorder(.white)
                            .background(Circle().fill(selectedMembers[index] ? Color("LightBlue") : .clear))
                            .frame(width: 20, height: 20)
                            .offset(x: -10)
                    }
                }
                .padding(.vertical, 5)
            }
        }
        .padding()
        .background(Color("DarkBlue2"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(.white)
    }
}

struct HosteeView_Previews: PreviewProvider {
    static var previews: some View {
        HosteeView()
    }
}
