//
//  SignupWithEmailScreen.swift
//  Motiv
//
//  Created by William Little on 2022-04-26.
//

import SwiftUI

struct SignupWithEmailScreen: View {
    
    // MARK: Allows for a custom back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    var animation: Animation {
        Animation.easeInOut
    }
    
    var body: some View {
        
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15) {
                    
                    // MARK: Return to Original Onboarding Screen
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        NavBackButton()
                            .frame(maxHeight: .infinity, alignment: .top)
                    })
                    
                    // MARK: Title with Leading Alignment
                    Text("Create Account")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 20)
                        .padding(.horizontal)
                    
                    // MARK: Name input field
                    GenericTextField(text: "Name", input: $onboardingVM.name)
                        .animation(animation)
                    
                    // MARK: Username input field
                    GenericTextField(text: "Username", input: $onboardingVM.username)
                        .animation(animation)
                    
                    // MARK: Program drop down menu
                    ProgramDropDownMenu()
                    
                    // MARK: Email input field
                    GenericTextField(text: "Email", input: $onboardingVM.email)
                        .animation(animation)
                    
                    // MARK: Password input field
                    GenericSecureField(text: "Password", input: $onboardingVM.password)
                        .animation(animation)
                    
                    
                    // MARK: Re-Enter Password input field
                    GenericSecureField(text: "Re-Enter Password", input: $onboardingVM.reenterPassword)
                        .animation(animation)
                    
                    // MARK: Links to school selection page
                    NavigationLink(destination: {
                        SelectSchoolView()},
                                   label: { OnboardingButton(buttonText: "Continue") })
                        .padding()
                        .offset(y: 70)
                    
                    
                    
                    
                }
                .alert("Sign up error",
                       isPresented: $onboardingVM.errorActive,
                       presenting: onboardingVM.errorMessage,
                       actions: { err in
                    Button("OK", action: { onboardingVM.errorMessage = "" })
                }, message: { err in
                    Text(err)
                })

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
            .background(Color("BG"))
            .environmentObject(onboardingVM)
        }
    }
}

struct SignupWithEmailScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupWithEmailScreen().environmentObject(OnboardingViewModel())
    }
}
