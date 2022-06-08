//
//  HouseEventPreview.swift
//  Motiv
//
//  Created by Thavish Perera on 2022-06-07.
//
import SwiftUI

struct HouseEventPreview: View {
    
    // TODO: Retrieve interested users from db
    @State private var invitedUsers = IndexingViewModel().dummyUsers

    let geo: GeometryProxy

    var body: some View {
        VStack {
            // Image and X
            ZStack(alignment: .leading) {
                Image("queenscampus") // TODO: Get image from database
                    .resizable()
                    .scaledToFill()

                //Event info
                // TODO: Get event info from db
                HStack {
                    Text("22' Year Party")
                        .font(.title.weight(.medium))
                        .padding()

                    Spacer()

                    VStack(spacing: 0) {
                        Text("13")
                            .foregroundColor(.black)
                            .font(.title.weight(.medium))

                        Divider()
                            .padding(.vertical, 3)

                        Text("MAY")
                            .foregroundColor(.secondary)
                            .font(.body.weight(.light))
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .fixedSize(horizontal: true, vertical: false)
                    .padding()
                }
            }
            .frame(width: geo.size.width - 30, height: geo.size.height * 0.25)
            .clipShape(RoundedRectangle(cornerRadius: 20))

            // Event Info cont.
            // TODO: Populate from database
            HStack {
                Text("Hosted by ")
                    + Text("79 Nelson")
                    .font(.title3.bold())

                Spacer()

                Text("10pm-2am")
                    .font(.body)
            }
            .font(.title3)
            .padding(.horizontal)
            .padding(.vertical, 10)

            // Friends
            HStack {
                Button { () } label: {
                    HStack(spacing: -15) {
                        ForEach(invitedUsers.prefix(4), id: \.self) { user in
                            AsyncImage(url: URL(string: user.profilePhoto)) { phase in
                                if let image = phase.image {
                                    image.resizable()
                                } else {
                                    Color.white
                                }
                            }
                            .frame(width: 30, height: 30)
                            .background(.clear)
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.black))
                        }

                        if invitedUsers.count - 4 > 0 {
                            Text("+\(invitedUsers.count - 4)")
                                .padding(5)
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(.blue))
                                .foregroundColor(.black)
                                .font(.caption2)
                        }
                    }
                }

                Text("Friends invited")
                    .font(.body.bold())
                Spacer()
            }
            .padding(.horizontal)

            // Buttons
            // TODO: Connect buttons
            HStack(spacing: 15) {
                Button("Going") { () }
                    .frame(width: geo.size.width * 0.4)
                    .padding(.vertical, 10)
                    .background(Color("Blue").opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .font(.body.bold())
                    .foregroundColor(.white)

                Button("Interested") { () }
                    .frame(width: geo.size.width * 0.4)
                    .padding(.vertical, 10)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .font(.body.bold())
                    .foregroundColor(Color("SearchBar"))
            }
        }
        .padding(.bottom)
        .background(Color("CircleBorder").opacity(0.7))
        .foregroundColor(.white)
        .frame(width: geo.size.width - 30)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct HouseEventPreview_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            HouseEventPreview(geo: geo)
        }
    }
}
