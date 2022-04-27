//
//  GenericTextField.swift
//  Motiv
//
//  Created by William Little on 2022-04-26.
//

import SwiftUI

struct GenericTextField: View {
    
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
                    .foregroundColor(Color("ButtonTitle"))
                    .padding(.horizontal, 50)
                    .font(.footnote)
                    .padding(.vertical, -9)
                ZStack {
                    
                    TextField("", text: $input)
                        .padding(.horizontal, 50)
                        .foregroundColor(Color("LightBlue"))
                        .autocapitalization(.none)

                }
            }
        }
    }
}
