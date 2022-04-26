//
//  CapsuleTabs.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI

struct CapsuleTabs: View {
    
    var selectedTab: Int = 0
    
    var body: some View {
        HStack {
            
            Capsule()
                .frame(width: self.selectedTab == 0 ? 23 : 15, height: 7)
                .foregroundColor(self.selectedTab == 0 ? Color("OnboardingButton") : Color("DarkBlue"))
                .animation(.easeInOut)
            
            Capsule()
                .frame(width: self.selectedTab == 1 ? 23 : 15, height: 7)
                .foregroundColor(self.selectedTab == 1 ? Color("OnboardingButton") : Color("DarkBlue"))
                .animation(.easeInOut)
            
            Capsule()
                .frame(width: self.selectedTab == 2 ? 23 : 15, height: 7)
                .foregroundColor(self.selectedTab == 2 ? Color("OnboardingButton") : Color("DarkBlue"))
                .animation(.easeInOut)

        }
    }
}

struct CapsuleTabs_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleTabs(selectedTab: 0)
    }
}
