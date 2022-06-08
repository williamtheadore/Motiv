//
//  EditProfileScreen.swift
//  Motiv
//
//  Created by William Little on 2022-05-19.
//

import SwiftUI

struct EditProfileScreen: View {
    
//    @EnvironmentObject var rootVM: RootViewModel
    
    var body: some View {
        VStack(alignment: .center) {
          
            // MARK: Header View
            HStack(spacing: 80) {
                
                // Cancel Button
                Button {
                    
                } label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .frame(minWidth: 55)
                }
                
                // Edit Profile Header
                Text("Edit Profile")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(minWidth: 60)
                
                // Save button only allowed when a field has changed
                Button {
                    
                } label: {
                    Text("Save")
                        .foregroundColor(.gray)
                        .frame(minWidth: 40)
                }

            }
            .padding()
            .frame(alignment: .top)
            
            Image("westerncover")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                .padding()
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
    }
}

struct EditProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileScreen()
    }
}
