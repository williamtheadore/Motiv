//
//  ContentView.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var onboardingVM = OnboardingViewModel()
    
    var body: some View {
        
        if !onboardingVM.signedIn {
            MainScreen()
                .environmentObject(onboardingVM)
        } else {
            OptionScreen()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
