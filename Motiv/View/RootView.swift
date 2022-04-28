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
        NavigationView {
            ZStack {
                if !onboardingVM.signedIn {
                    MainScreen()
                    
                } else {
                    OptionScreen()
                }
            }
        }
        .environmentObject(onboardingVM)

    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
