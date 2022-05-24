

import SwiftUI

struct BottomCardView: View {
    
    var school: String
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    @EnvironmentObject var authService: AuthService
    
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
                Text(" " + onboardingVM.school + "?")
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundColor(.white)

            }
            
            NavigationLink(destination: {
                ProgramInputView()
                    .environmentObject(onboardingVM)
                    .environmentObject(authService)
            }, label: {
                OnboardingButton(buttonText: "Continue")

            })
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color("DarkBlue"))
        .cornerRadius(30)
        .shadow(radius: 20)
        .navigationBarHidden(true)
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
