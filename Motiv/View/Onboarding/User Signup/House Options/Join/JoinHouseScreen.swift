//
//  JoinHouseScreen.swift
//  Motiv
//
//  Created by William Little on 2022-04-28.
//

import SwiftUI

struct JoinHouseScreen: View {
    var body: some View {
        ZStack {
            
            Text("Join house")
                .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
        .navigationBarHidden(true)
    }
}

struct JoinHouseScreen_Previews: PreviewProvider {
    static var previews: some View {
        JoinHouseScreen()
    }
}
