//
//  NameInputView.swift
//  Motiv
//
//  Created by William Little on 2022-05-13.
//

import SwiftUI

struct NameInputView: View {
    
    @FocusState private var showKeyboard: Bool
    @State var fullName: String = ""
    
    @StateObject var onboardingVM = OnboardingViewModel()
    
    @StateObject var authService = AuthService()

    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20){
                
                // MARK: Motiv Logo aligned at top
                Image("WhiteLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .padding(.vertical)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                // MARK: Caption Text
                Text("Let's begin, what is your name?")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
//                    .font(.system(size: 22))
                    .font(Font.custom("HelveticaNeue-bold", size: 22))
                
                // MARK: Textfield for users input
                // Requires focused to show keyboard upon appear
                TextField("", text: $authService.fullName)
                    .focused($showKeyboard)
                    .font(Font.custom("HelveticaNeue-bold", size: 36))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    UsernameInputView()
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
}
