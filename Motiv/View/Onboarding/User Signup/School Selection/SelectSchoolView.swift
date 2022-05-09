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
    
    // MARK: Variable required to return to sign up page upon Firebase error
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
        var body: some View {
            VStack {
                
                TitleView()
                    .animation(
                        Animation
                            .default
                            .delay(0.1)
                        )
                    .blur(radius: showSchool ? 5 : 0)
                    .offset(x: -30, y: 15)
                SchoolsScreen()
                    .onTapGesture {
                        showSchool.toggle()
                    }
                BottomCardView(school: school)
//                    .blur(radius: showSchool ? 0 : 20)

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
