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
            
            VStack(alignment: .leading) {
                Text(text)
                    .foregroundColor(Color("ButtonTitle"))
                    .padding(.horizontal, 50)
                    .padding(.vertical, -10)
                    .offset(y: 3)
                    .font(.footnote)
                if input.isEmpty {
                    

                    ZStack {
                        Text("\(text)...")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 50)
                        TextField("", text: $input)
                            .padding(.horizontal, 50)
                            .foregroundColor(Color("LightBlue"))
                            .autocapitalization(.none)
                    }
                    .offset(y: 3)

                } else {
                    ZStack {
                        TextField("", text: $input)
                            .padding(.horizontal, 50)
                            .foregroundColor(Color("LightBlue"))
                            .autocapitalization(.none)
                    }
                    .offset(y: 3)

                }
                
            }
        }
    }
}
