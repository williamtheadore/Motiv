//
//  HouseOptionView.swift
//  Motiv
//
//  Created by William Little on 2022-05-24.
//

import SwiftUI

struct HouseOptionView: View {
    var body: some View {
        GeometryReader { reader in
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: reader.size.width - 40, height: reader.size.height / 2)
                    .foregroundColor(Color("BG"))
                    .opacity(0.9)
                VStack(alignment: .center) {
                    Text("Select an option")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .frame(alignment: .center)
    }
}

struct HouseOptionView_Previews: PreviewProvider {
    static var previews: some View {
        HouseOptionView()
    }
}

//struct GeometryReaderCentered<Content: View>: View {
//    var content: (GeometryProxy) -> Content
//
//    var body: some View {
//        GeometryReader { geometry in
//            Group {
//                content(geometry)
//            }
//            .frame(
//                width: geometry.size.width,
//                height: geometry.size.height,
//                alignment: .center
//            )
//        }
//    }
//}
