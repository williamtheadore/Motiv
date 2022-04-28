//
//  TestView.swift
//  DesignCode
//
//  Created by William Little on 2021-08-10.
//  Copyright © 2021 Meng To. All rights reserved.
//

import SwiftUI

struct SelectSchoolView: View {
        
    @State var showSchool = false
    @State var school = ""
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    // MARK: Required variable to return to sign up page upon Firebase error
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
        var body: some View {
            ZStack {
                
                TitleView()
                    .animation(
                        Animation
                            .default
                            .delay(0.1)
                        )
                    .blur(radius: showSchool ? 5 : 0)
                    .offset(x: -30, y: 15)
                HStack(alignment: .center, spacing: 15) {
                    QueensCardView()
                        .onTapGesture {
                            self.showSchool.toggle()
                            onboardingVM.school = "Queen's University"
                        }
                    WesternCardView()
                        .onTapGesture {
                            self.showSchool.toggle()
                            onboardingVM.school = "University of Western Ontario"
                        }
                }
                    .modifier(ScrollingHStackModifier(items: 2, itemWidth: 350, itemSpacing: 30))
                    .offset(y: -50)
                BottomCardView(school: school)
                    .offset(y: showSchool ? 600 : 1000)
                    .blur(radius: showSchool ? 0 : 20)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
            .background(Color("BG"))
            .environmentObject(onboardingVM)
        }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSchoolView().environmentObject(OnboardingViewModel())
    }
}
