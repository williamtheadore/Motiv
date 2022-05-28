//
//  HouseScreen.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//

import SwiftUI

struct HouseScreen: View {
    
    @EnvironmentObject var rootVM: RootViewModel

    var body: some View {
        VStack {
            Text("House Screen")
            Button("Sign out") {
                rootVM.signout()
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct HouseScreen_Previews: PreviewProvider {
    static var previews: some View {
        HouseScreen()
    }
}
