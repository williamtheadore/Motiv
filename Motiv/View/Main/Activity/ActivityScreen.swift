//
//  ActivityScreen.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//

import SwiftUI

struct ActivityScreen: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    
    var body: some View {
        VStack {
            Text("Activity Screen")
            Button("Sign out") {
                rootVM.signout()
            }
        }
    }
}

struct ActivityScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActivityScreen()
    }
}
