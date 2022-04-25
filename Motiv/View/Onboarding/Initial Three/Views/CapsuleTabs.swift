//
//  CapsuleTabs.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI

struct CapsuleTabs: View {
    var body: some View {
        HStack {
            
            Capsule()
                .frame(width: 23, height: 7)
                .foregroundColor(Color("OnboardingButton"))
            Capsule()
                .frame(width: 15, height: 7)
                .foregroundColor(Color("DarkBlue"))
            Capsule()
                .frame(width: 15, height: 7)
                .foregroundColor(Color("DarkBlue"))
            
        }
    }
}

struct CapsuleTabs_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleTabs()
    }
}
