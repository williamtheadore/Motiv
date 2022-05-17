//
//  ScreenOne.swift
//  Motiv
//
//  Created by William Little on 2022-05-13.
//

import SwiftUI

struct OnboardingScreens: View {
    
    @State var screenState: Int = 0
    @State var showInputScreen: Bool = false
    
    @AppStorage("onboardingComplete") var onboardingComplete = false
    
    func incrementTab() {
        if screenState < 2 {
            self.screenState += 1
        } else {
            self.onboardingComplete = true
        }
    }
    
    let whiteTitles = [
        "Party Hosting,",
        "Find",
        "Social Media for"
    ]
    
    let blueTitles = [
        "Made Easy.",
        "Every",
        "\nCollege Housing."
    ]
    
    let captions = [
        "Streamlining the college event planning process",
        "Your weekends just became a lot easier",
        "Designed and optimized for college students"
    ]
    
    let buttonTitles = [
        "Get Started",
        "Continue",
        "Join Motiv"
    ]
    
    var body: some View {
        VStack(alignment: .center) {
            
            // MARK: Top Logo
            Image("WhiteLogo")
                .resizable()
                .frame(width: 22, height: 22)
                .offset(y: screenState == 2 ? 5 : 0)
                .padding(.top)
            
            Spacer()
            
            // MARK: Title View
            // Conditional statement because one title requires VStack
            if screenState == 2 {
                VStack {
                    Text("College Housing")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .font(.system(size: 28))
                    Text("Social Media.")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 28))
                }
                .offset(y: screenState == 2 ? 5 : 0)
                //                .padding(.top, 5)
            } else {
                HStack(spacing: 5) {
                    Text(whiteTitles[screenState])
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 28))
                    Text(blueTitles[screenState])
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .font(.system(size: 28))
                    if screenState == 1 {
                        Text("Bar Event.")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 28))
                    }
                }
                .offset(y: screenState == 2 ? 5 : 0)
                
            }
            
            // MARK: Gray caption below title
            Text(captions[screenState])
                .foregroundColor(.gray)
                .padding(.bottom)
                .font(.system(size: 15))
                .offset(y: screenState == 2 ? 5 : 0)
            
            Image("MapPageGradient")
                .resizable()
                .scaledToFit()
                .frame(height: 450)
                .padding()
            
            // MARK: Capsule tabs to display onboarding progress
            CapsuleTabs(selectedTab: self.screenState)
                .padding()
            
            Spacer()
            
            // MARK: Bottom button to proceed onboarding process
            Button(action: {
                self.incrementTab()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: UIScreen.main.bounds.maxX - 50, height: 60)
                        .foregroundColor(Color("LightBlue"))
                    Text(buttonTitles[screenState])
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
            })
            if screenState == 2 {
                HStack(spacing: 5) {
                    Text("Joining as an organization?")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                    
                    Button(action: {
                        showInputScreen.toggle()
                    }, label: {
                        Text("Continue")
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                    })
                }
            }
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
        
    }
}

struct OnboardingScreens_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreens()
    }
}
