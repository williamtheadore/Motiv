//
//  GoogleButton.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI

struct GoogleButton: View {
    
    var body: some View {
        
        ZStack {
            
            // MARK: Rectangle with Border
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("OnboardingCaption"))
                .frame(width: UIScreen.main.bounds.maxX - 69, height: 56)
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("BG"))
                .frame(width: UIScreen.main.bounds.maxX - 71, height: 54)
            
            // MARK: Text and Google Logo
            HStack {
                Image("GoogleLogo")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Continue with Google")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

struct GoogleButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleButton()
    }
}
