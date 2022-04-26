//
//  LoginScreen.swift
//  Motiv
//
//  Created by William Little on 2022-04-26.
//

import SwiftUI

struct LoginScreen: View {
    
    // MARK: Allows for a custom back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    var body: some View {
        VStack {
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                NavBackButton()
                    .frame(maxHeight: .infinity, alignment: .top)
            })
            
            
            // MARK: Middle Login Title and Welcome Text
            VStack(alignment: .leading) {
                Text("Login")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("Welcome back.")
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 30)
            .offset(y: -120)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack(spacing: 23) {
                // MARK: Continue with Google Button
                Button(action: {
                    Void()
                }, label: {
                    GoogleButton()
                })
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.maxX - 60, height: 1)
                    .foregroundColor(.gray)
                
                // MARK: Email Textfield
                GenericTextField(text: "Email", input: $onboardingVM.loginEmail)
                
                // MARK: Password Textfield
                GenericSecureField(text: "Password", input: $onboardingVM.loginPassword)
                
                Button(action: {
                    onboardingVM.login()
                }, label: {
                    OnboardingButton(buttonText: "Login")
                })
            
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .bottom)

            
        }
        .environmentObject(onboardingVM)
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
