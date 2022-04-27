//
//  TitleView.swift
//  DesignCode
//
//  Created by William Little on 2021-08-10.
//  Copyright © 2021 Meng To. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select School")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Connect and find friends in your area")
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
