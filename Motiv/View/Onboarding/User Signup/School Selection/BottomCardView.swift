

import SwiftUI

struct BottomCardView: View {
    
    // MARK: Allows for a custom back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var school: String
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.15)
            
            HStack(spacing: 2) {
                Text("Join")
                    .font(.headline)
                    .foregroundColor(.white)
                Text(" \(onboardingVM.school)?")
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundColor(.white)

            }
            
            Button(action: {
                
                // MARK: Attempts sign in and catches error
                DispatchQueue.main.async {
                    onboardingVM.signupWithEmail()
                    
                                        
                    if onboardingVM.errorActive {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
            }, label: {
                OnboardingButton(buttonText: "Sign up")
            })
            
            HStack(spacing: 5) {
                
                Text("Terms of Service")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(Color("LightBlue"))
                Text("and")
                    .font(.footnote)
                    .foregroundColor(Color("LightBlue"))
                Text("Privacy Policy")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(Color("LightBlue"))
                
            }
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color("DarkBlue"))
        .cornerRadius(30)
        .shadow(radius: 20)
        .environmentObject(onboardingVM)
    }
}


struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView(school: "Queen's University")
    }
}

struct ContinueButtonView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .frame(width: 130, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
            Text("Continue")
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
        .offset(y: 20)
    }
}
