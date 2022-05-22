//
//  MapScreen.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//

import SwiftUI

struct MapScreen: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    
    var body: some View {
        VStack {
            Text("Map Screen")
            Button("Sign out") {
                rootVM.signout()
            }
        }
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}
