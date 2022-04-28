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
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Select an option")
                .fontWeight(.bold)
                .font(.system(size: 28))
                .foregroundColor(.white)
                .padding()
            
            // MARK: Leads to create a house page
            NavigationLink(destination: {
                CreateHouseScreen()
            }, label: {
                OptionCardView(titleText: "Create a house", captionText: "Create your house type and invite\nyour housemates to join.", systemImageName: "plus")
            })
            
            // MARK: Leads to join a house page
            NavigationLink(destination: {
                Text("Join house")
            }, label: {
                OptionCardView(titleText: "Join a house", captionText: "Join an existing house and start\nhosting events.", systemImageName: "house")
            })
            
            
            
            Button("Sign out") {
                onboardingVM.signout()
            }
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
