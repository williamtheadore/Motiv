//
//  ProgramInputView.swift
//  Motiv
//
//  Created by William Little on 2022-05-15.
//

import SwiftUI

struct ProgramInputView: View {
    @FocusState private var showKeyboard: Bool
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            
            // MARK: Motiv Logo aligned at top
            Image("WhiteLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .padding(.top)
                .frame(maxHeight: .infinity, alignment: .top)
            
            // MARK: Caption Text
            Text("What is your program at\nQueen's University?")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 22))
                .multilineTextAlignment(.center)
            
            // MARK: Textfield for users input
            // Requires focused to show keyboard upon appear
            TextField("", text: $authService.program)
                .focused($showKeyboard)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            NavigationLink(destination: {
                PhoneInputView()
                    .environmentObject(onboardingVM)
                    .environmentObject(authService)
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: UIScreen.main.bounds.maxX - 50, height: 60)
                        .foregroundColor(Color("LightBlue"))
                    Text("Continue")
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
            })
                .padding()

        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showKeyboard = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct ProgramInputView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramInputView()
    }
}
