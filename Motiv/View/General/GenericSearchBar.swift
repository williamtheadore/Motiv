//
//  GenericSearchbaR.swift
//  Motiv
//
//  Created by William Little on 2022-05-03.
//

import SwiftUI

struct GenericSearchBar: View {
    
    let text: String
    @Binding var input: String
    
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .frame(width: UIScreen.main.bounds.maxX - 30, height: 50)
                .foregroundColor(Color("SearchBar"))
            
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 19, height: 19)
                    .foregroundColor(.gray)
                
                if input.isEmpty {
                    ZStack {
                        Text("Username or name...")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("", text: $input)
                            .autocapitalization(.none)
                            .foregroundColor(.white)
                    }
                } else {
                    ZStack {
                        TextField("", text: $input)
                            .autocapitalization(.none)
                            .foregroundColor(.white)
                    }
                }
                
                
            }
            .padding(.horizontal, 40)
        }
    }
}
