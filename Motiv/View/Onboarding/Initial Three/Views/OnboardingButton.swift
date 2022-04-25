//
//  OnboardingButton.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI

struct OnboardingButton: View {
    
    var buttonText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: UIScreen.main.bounds.maxX - 60, height: 60)
                .foregroundColor(Color("OnboardingButton"))
            HStack {
                Text(buttonText)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                Image(systemName: "chevron.right")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 10, height: 18)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

