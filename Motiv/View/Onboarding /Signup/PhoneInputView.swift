//
//  PhoneInputView.swift
//  Motiv
//
//  Created by William Little on 2022-05-15.
//

import SwiftUI
import PhoneNumberKit
import iPhoneNumberField

struct PhoneInputView: View {
    
    @FocusState private var showKeyboard: Bool
    @State private var smsSent: Bool = false
    @State private var verCode: String = ""
    
    // MARK: Firebase Authorization Service
    @StateObject private var authService = AuthService()
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    
    func sendSMS() {
        
        self.smsSent = true
        authService.phoneAuth(phNo: "+1" + changeNumber(onboardingVM.phoneNumber))
        
    }
    
    // MARK: Signs user up
    func signup() {
        
        onboardingVM.dbSignUp()
        authService.signInWithPhone(verificationCode: verCode)
        
    }
    
    // MARK: Filter to remove any none numerical characters in phone number
    func changeNumber(_ number: String) -> String {
        
        let newNum = number.filter("0123456789".contains)
        
        print("Trimmed phone number: \(newNum)")
        
        return newNum
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 15){
            
            // MARK: Motiv Logo aligned at top
            Image("WhiteLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .padding(.top)
                .frame(maxHeight: .infinity, alignment: .top)
            
            // MARK: Caption Text
            if smsSent {
                Text("Finish signing up by entering the code\nwe sent to +1 \(onboardingVM.phoneNumber)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
            } else {
                Text("Create account using phone number")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 18))
            }
            
            
            // MARK: Textfield for users input
            // Requires focused to show keyboard upon appear
            if smsSent {
                TextField("* * * * * *", text: $verCode)
                    .focused($showKeyboard)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.title)
                    .keyboardType(.numberPad)
                    .onChange(of: verCode) { newCode in
                        if newCode.count == 6 {
                            authService.signInWithPhone(verificationCode: newCode)
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.showKeyboard = true
                        }
                    }
            } else {
                HStack(alignment: .center) {

                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 51.5, height: 31.5)
                            .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 50, height: 30)
                            .foregroundColor(Color("BG"))
                        Text("+1")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                    }
                    
                    iPhoneNumberField(text: $onboardingVM.phoneNumber)
                        .font(UIFont(size: 32, weight: .semibold, design: .default))
                        .foregroundColor(Color.white)
                        .focused($showKeyboard)
                        
                }
                .padding(.horizontal, 40)
            }
            
                
            Spacer()
            
            VStack(spacing: 5) {
                Text("By tapping \"Create Account\", you agree to our")
                    .foregroundColor(.white)
                    .fontWeight(.light)
                    .font(.caption)
                HStack(spacing: 5) {
                    Text("Privacy Policy")
                        .foregroundColor(Color("LightBlue"))
                        .fontWeight(.semibold)
                        .font(.caption)
                    Text("and")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .font(.caption)
                    Text("Terms of Service")
                        .foregroundColor(Color("LightBlue"))
                        .fontWeight(.semibold)
                        .font(.caption)
                }
            }
                .offset(y: smsSent ? 60 : 75)

            // MARK: Create Account Button
            if onboardingVM.phoneNumber.count != 14 && !smsSent {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: UIScreen.main.bounds.maxX - 50, height: 60)
                        .foregroundColor(Color("LightBlue"))
                        .opacity(0.4)
                    Text(smsSent ? "Create Account and Verify" : "Send SMS")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10)
                        .foregroundColor(.black)
                        .padding(.trailing, 40)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom)
            } else {
                
                Button(action: {
                    if !self.smsSent {
                        self.sendSMS()
                    } else {
                        self.signup()
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.main.bounds.maxX - 50, height: 60)
                            .foregroundColor(Color("LightBlue"))
                        Text(smsSent ? "Create Account and Verify" : "Send SMS")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                            .foregroundColor(.black)
                            .padding(.trailing, 40)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom)
                })
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showKeyboard = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG").ignoresSafeArea())
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct PhoneInputView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneInputView()
    }
}
