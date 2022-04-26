//
//  GenericSecureField.swift
//  Motiv
//
//  Created by William Little on 2022-04-26.
//

import SwiftUI

struct GenericSecureField: View {
    
    let text: String
    @Binding var input: String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 5)
                .frame(width: UIScreen.main.bounds.maxX - 60, height: 60)
                .foregroundColor(Color("DarkBlue"))
                .offset(y: -3)
            
            VStack(alignment: .leading) {
                Text(text)
                    .foregroundColor(Color("OnboardingCaption"))
                    .font(.footnote)
                    .padding(.vertical, -9)
                SecureField("Enter Email", text: $input)
                    .foregroundColor(Color("LightBlue"))
            }
            .padding(.horizontal, 40)

        }
    }
}
//
//struct GenericSecureField_Previews: PreviewProvider {
//    static var previews: some View {
//        GenericSecureField(text: "Password", input: "Finley2019!")
//    }
//}
