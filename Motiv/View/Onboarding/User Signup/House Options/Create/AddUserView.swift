//
//  AddUserView.swift
//  Motiv
//
//  Created by William Little on 2022-05-08.
//

import SwiftUI
import SDWebImageSwiftUI

struct AddUserView: View {
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    
    let user: User
    @State var added: Bool
    
    // Adds and removes users to housemate list
    func addUser(user: User) {
        
        if self.onboardingVM.housemates.contains(user) {
            
            if let index = self.onboardingVM.housemates.firstIndex(of: user) {
                self.onboardingVM.housemates.remove(at: index)
            }
            
        } else {
            
            self.onboardingVM.housemates.append(user)
            
        }
        
        self.added.toggle()
        
    }
    
    var body: some View {
        HStack(spacing: 10) {
            
            WebImage(url: URL(string: user.profilePhoto))
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(user.username)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
            
            Button(action: {
                self.addUser(user: self.user)
            }, label: {
                if !added {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 80, height: 25)
                            .foregroundColor(Color("DarkBlue"))
                        Text("Add")
                            .font(.footnote)
                            .foregroundColor(Color("LightBlue"))
                    }
                    .animation(.easeInOut)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 80, height: 25)
                            .foregroundColor(Color("LightBlue"))
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 78, height: 23)
                            .foregroundColor(Color("BG"))
                        Text("Added")
                            .font(.footnote)
                            .foregroundColor(Color("LightBlue"))
                    }
                    .animation(.easeInOut)
                }
            })
        }
        .padding(.horizontal, 20)
        .environmentObject(onboardingVM)
    }
}

