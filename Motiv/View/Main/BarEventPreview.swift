//
//  BarEventPreview.swift
//  Motiv
//
//  Created by Thavish Perera on 2022-05-30.
//

import SwiftUI

struct BarEventPreview: View {
    @State private var interestedUsers = IndexingViewModel().dummyUsers

    var body: some View {
        GeometryReader { geo in
            VStack {
                // Image and X
                ZStack(alignment: .topTrailing) {
                    Image("queenscampus")
                        .resizable()
                        .scaledToFill()

                    Button {} label: {
                        Image(systemName: "xmark")
                            .padding()
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .thin))
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.25, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                // Event Info
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Ritual")
                            .font(.largeTitle.weight(.medium))
                        Text("Clark Hall Pub")
                            .font(.title.weight(.light))
                    }

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
                }
                .padding(.horizontal)
                .padding(.vertical, 10)

                // Friends
                HStack {
                    HStack(spacing: -15) {
                        ForEach(0 ... 3, id: \.self) { num in
                            Button {} label: {
                                AsyncImage(url: URL(string: interestedUsers[num].profilePhoto)) { phase in
                                    if let image = phase.image {
                                        image.resizable() // Displays the loaded image.
                                    } else if phase.error != nil {
                                        Color.red // Indicates an error.
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
                        }

                        Text("+\(interestedUsers.count-4)")
                            .padding(5)
                            .frame(width: 30, height: 30)
                            .background(.white)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.blue))
                            .foregroundColor(.black)
                            .font(.caption2)
                    }

//                    Spacer()
                    Text("Friends interested")
                        .font(.body.bold())
                    Spacer()
                }
                .padding(.horizontal)

                // Buttons
                HStack(spacing: 15) {
                    Button("Going") {}
                        .frame(width: geo.size.width * 0.45)
                        .padding(.vertical, 10)
                        .background(Color("Blue").opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .font(.body.bold())
                        .foregroundColor(Color("LightBlue"))

                    Button("Interested") {}
                        .frame(width: geo.size.width * 0.45)
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
            .frame(width: geo.size.width)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct BarEventPreview_Previews: PreviewProvider {
    static var previews: some View {
        BarEventPreview()
    }
}
