//
//  CreatePreview.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//

import SwiftUI

struct CreatePreview: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    
    var body: some View {
        VStack {
            Text("Create View")
            Button("Sign out") {
                rootVM.signout()
            }
        }
    }
}

struct CreatePreview_Previews: PreviewProvider {
    static var previews: some View {
        CreatePreview()
    }
}
