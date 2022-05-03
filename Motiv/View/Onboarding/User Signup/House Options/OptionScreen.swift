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
        VStack(alignment: .center, spacing: 10) {
            
            Text("Select an option")
                .fontWeight(.bold)
                .font(.system(size: 28))
                .foregroundColor(.white)
                .padding()
                .offset(x: -70, y: -90)
            
            // MARK: Leads to create a house page
            NavigationLink(destination: {
                CreateHouseScreen()
            }, label: {
                OptionCardView(titleText: "Create a house", captionText: "Create your house type and invite\nyour housemates to join.", systemImageName: "plus")
            })
                .offset(y: -70)

            
            // MARK: Leads to join a house page
            NavigationLink(destination: {
                Text("Join house")
            }, label: {
                OptionCardView(titleText: "Join a house", captionText: "Join an existing house and start\nhosting events.", systemImageName: "house")
            })
                .offset(y: -70)

            
            
            
//            Button("Sign out") {
//                onboardingVM.signout()
//            }

            //
            HStack(spacing: 5) {
                Text("Don't want to join or create a house?")
                    .font(.system(size: 15))
                    .foregroundColor(Color("OnboardingButton"))
                Button(action: {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"))
        .environmentObject(onboardingVM)
    }
}

struct OptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        OptionScreen().environmentObject(OnboardingViewModel())
    }
}
