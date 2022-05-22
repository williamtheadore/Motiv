//
//  ContentView.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI
import Firebase

struct RootView: View {
        
    @AppStorage("onboardingComplete") var onboardingComplete: Bool = false
    @AppStorage("signedIn") var signedIn: Bool = false
    @AppStorage("loading") var loading: Bool = false
    
    @StateObject var rootVM = RootViewModel()
    
    var body: some View {
        
        // MARK: Root View always allow for loading screen as storage variable
        if loading {
            ZStack {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BG"))
        } else {
            if !signedIn {
                // MARK: 
                if !onboardingComplete {
                    OnboardingScreens()
                } else {
                    NameInputView()
                }
            } else {
                    MainRootView()
                    .environmentObject(rootVM)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
