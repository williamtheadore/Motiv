//
//  EditProfileScreen.swift
//  Motiv
//
//  Created by William Little on 2022-05-19.
//

import SwiftUI

struct EditProfileScreen: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                
                // MARK: Header View
                HStack(spacing: 80) {
                    
                    // Cancel Button
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
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
                
                // Profile Image
                Image("westerncover")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .padding(.vertical, 10)
                
                Button {
                    
                } label: {
                    Text("Edit Profile Photo")
                        .foregroundColor(Color("LightBlue"))
                        .font(.caption)
                }
                
                Spacer()
                
                // Sign out button
                Button {
                    rootVM.signout()
                } label: {
                    Text("Sign out")
                        .foregroundColor(.red)
                        .padding()
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BG"))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct EditProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileScreen()
    }
}
