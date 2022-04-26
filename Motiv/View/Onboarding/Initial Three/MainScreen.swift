//
//  ScreenOne.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI

struct MainScreen: View {
    
    @StateObject var onboardingVM = OnboardingViewModel()
    
    // MARK: Landing page
    var body: some View {
        
        VStack {

            Group {
                
                // MARK: Fixed Logo View
                CircleLogoView()
                
                // MARK: Animated Capsule View
                CapsuleTabs(selectedTab: onboardingVM.tabSelection)
                    .padding()
                
                // MARK: Title view
                Text(onboardingVM.titles[onboardingVM.tabSelection])
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title)
                
                // MARK: Caption view
                Text(onboardingVM.captions[onboardingVM.tabSelection])
                    .foregroundColor(Color("OnboardingCaption"))
                    .padding(.vertical, -10)
                    .font(.system(size: 16))
            }
            .offset(y: 160)
            
            // MARK: Bottom Button
            if onboardingVM.tabSelection < 2 {
                Button(action: {
                    onboardingVM.incrementTab()
                }, label: {
                    if onboardingVM.tabSelection == 0 {
                        OnboardingButton(buttonText: "Get Started")

                    } else {
                        OnboardingButton(buttonText: "Continue")
                    }
                })
            } else {
                
                VStack {
                    Button(action: {
                        onboardingVM.signupWithEmail()
                    }, label: {
                        OnboardingButton(buttonText: "Sign up with email")
                    })
                }
            }
            
        }
        .environmentObject(onboardingVM)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
