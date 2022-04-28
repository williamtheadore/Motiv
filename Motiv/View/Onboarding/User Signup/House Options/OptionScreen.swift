//
//  OptionScreen.swift
//  Motiv
//
//  Created by William Little on 2022-04-27.
//

import SwiftUI

struct OptionScreen: View {
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Select an option")
                .fontWeight(.bold)
                .font(.system(size: 28))
            
            Button("Sign out") {
                onboardingVM.signout()
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"))
        .environmentObject(onboardingVM)
    }
}

struct OptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        OptionScreen()
    }
}
