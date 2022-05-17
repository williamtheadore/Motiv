//
//  ScreenOne.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI

struct MainScreen: View {
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    // MARK: Landing page
    var body: some View {
        
        
        VStack {
            
            // MARK: Main Centre View
            VStack {
                
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
            .offset(y: 60)
            
            // MARK: Sign up and continue buttons
            VStack(spacing: 15) {
                
                if onboardingVM.tabSelection > 1 {
                    Button(action: {
                        Void()
                    }, label: {
                        GoogleButton()
                    })
                    
                    HStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.maxX / 2 - 40, height: 1, alignment: .trailing)
                            .foregroundColor(Color("OnboardingCaption"))
                        Text("Or")
                            .foregroundColor(.gray)
                            .font(.footnote)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.maxX / 2 - 40, height: 1, alignment: .leading)
                            .foregroundColor(Color("OnboardingCaption"))
                    }
                }
                
                // MARK: Main Bottom Button with Switching Titles and Navigation Link Upon End
                if onboardingVM.tabSelection < 2 {
                    Button(action: {
                        onboardingVM.incrementTab()
                    }, label: {
                        OnboardingButton(buttonText: onboardingVM.buttonTitles[self.onboardingVM.tabSelection])
                    })
                } else {
                    NavigationLink(destination: SignupWithEmailScreen(), label: {
                        OnboardingButton(buttonText: onboardingVM.buttonTitles[self.onboardingVM.tabSelection])
                    })
                }
                
                
                if onboardingVM.tabSelection > 1 {
                    
                    // MARK: Sign in button and text
                    HStack {
                        
                        Text("Already have an account?")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                        
                        NavigationLink(destination: {
                            LoginScreen()
                        }, label: {
                            Text("Sign in")
                                .font(.system(size: 15))
                                .foregroundColor(Color("Blue"))
                                .fontWeight(.bold)
                        })
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
        .environmentObject(onboardingVM)
        .navigationBarHidden(true)
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
