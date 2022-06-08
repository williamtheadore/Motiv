//
//  HousePreview.swift
//  Motiv
//
//  Created by Thavish Perera on 2022-05-31.
//

import SwiftUI

struct HousePreview: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                // Image and X
                ZStack(alignment: .top) {
                    Image("queenscampus") //TODO: Get house image from database
                        .resizable()
                        .scaledToFill()

                    Button { Void() } label: { // TODO: Connect button
                        Image(systemName: "chevron.down")
                            .padding()
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .regular))
                    }
                }
                .frame(width: geo.size.width - 10, height: geo.size.height * 0.25, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                // House Info
                // TODO: Populate using database
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("79 Nelly")
                            .font(.largeTitle.weight(.medium))
                        Text("HOUSE")
                            .font(.title2.weight(.light))
                        HStack {
                            Text("1,833")
                                .font(.title3.weight(.heavy))
                                .foregroundColor(Color("LightBlue"))
                            Text("Motiv Score")
                                .font(.title3.weight(.light))
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)

                // TODO: Populate using database
                HStack {
                    Spacer()
                    VStack {
                        Text("11")
                            .font(.title.bold())
                        Text("Events")
                            .font(.title2)
                    }
                    Spacer()
                    VStack {
                        Text("6")
                            .font(.title.bold())
                        Text("Housemates")
                            .font(.title2)
                    }
                    Spacer()
                }
                .padding([.horizontal, .bottom])

                // Buttons
                // TODO: Connect buttons
                HStack(spacing: 15) {
                    Button("Visit") { Void() }
                        .frame(width: geo.size.width * 0.4)
                        .padding(.vertical, 10)
                        .background(Color("Blue").opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .font(.body.bold())
                        .foregroundColor(Color("LightBlue"))

                    Button("Follow") { Void() }
                        .frame(width: geo.size.width * 0.4)
                        .padding(.vertical, 10)
                        .background(Color("Blue"))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .font(.body.bold())
                }
            }
            .padding(.bottom)
            .background(Color("CircleBorder").opacity(0.7))
            .foregroundColor(.white)
            .frame(width: geo.size.width - 10)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct HousePreview_Previews: PreviewProvider {
    static var previews: some View {
        HousePreview()
    }
}
