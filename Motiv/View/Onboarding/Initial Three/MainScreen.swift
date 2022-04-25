//
//  ScreenOne.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI

struct ScreenOne: View {
    
    @StateObject var onboardingVM = OnboardingViewModel()
    
    // MARK: Landing page
    var body: some View {
        
        VStack {

            Group {
                CircleLogoView()
                
                CapsuleTabs()
                    .padding()
                
                // Title view
                Text("Welcome to Motiv")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title)
                
                // Caption
                Text("Never miss an event again. Join your friends\nand begin hosting and attending events now.")
                    .foregroundColor(Color("OnboardingCaption"))
                    .padding(.vertical, -10)
            }
            .offset(y: 150)
            
            // MARK: Bottom button
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

struct ScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        ScreenOne()
    }
}
