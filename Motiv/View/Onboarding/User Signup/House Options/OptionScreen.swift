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
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                
                Text("Select an option")
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.horizontal)
                    .padding(.top, 25)
                
                // MARK: Leads to create a house page
                NavigationLink(destination: {
                    CreateHouseScreen()
                }, label: {
                    OptionCardView(titleText: "Create a house", captionText: "Invite your housemates  and\ncustomize your page.", systemImageName: "plus")
                })
                    .offset(y: -100)

                
                // MARK: Leads to join a house page
                NavigationLink(destination: {
                    JoinHouseScreen()
                }, label: {
                    OptionCardView(titleText: "Join a house", captionText: "Join an existing house and start\nhosting events.", systemImageName: "house")
                })
                    .offset(y: -95)
                
                Button(action: {
                    onboardingVM.signout()
                }, label: {
                    Text("Sign out")
                })


                // MARK: Skip Option
                HStack(spacing: 5) {
                    Text("Don't want to join or create a house?")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("OnboardingButton"))
                    Button(action: {
                        // MARK: Will lead to main tab view
                        Void()
                    }, label: {
                        Text("Skip")
                            .foregroundColor(.blue)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                    })
                }
                .padding(10)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"))
        .navigationBarHidden(true)
        .environmentObject(onboardingVM)
    }
}

struct OptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        OptionScreen().environmentObject(OnboardingViewModel())
    }
}
