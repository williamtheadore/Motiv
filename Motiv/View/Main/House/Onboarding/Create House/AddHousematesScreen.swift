//
//  AddHousematesScreen.swift
//  Motiv
//
//  Created by William Little on 2022-06-04.
//

import SwiftUI

struct AddHousematesScreen: View {
    
    @State var searchText: String = ""
    @StateObject var indexVM = IndexingViewModel()
    
    @State private var invitedUsers: [User] = []
    
    var body: some View {
        VStack(alignment: .center) {
            
            // MARK: Back button and Add
            HStack {
                
                // TODO: Return to previous page
                Image(systemName: "chevron.left")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 10, height: 20)
                    .padding()
                
                Spacer()

//                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Add Housemates")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Spacer()

                
            }
//            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 30)
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("SearchBar"))
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search ..", text: $indexVM.searchText)
                        .foregroundColor(.white)
                }
                .foregroundColor(.gray)
                .padding(.leading, 13)

            }
            .frame(height: 50)
            .cornerRadius(15)
            .padding(.top)
            .padding(.horizontal)
            
            List {
                if self.indexVM.searchText != "" {
                    ForEach(self.indexVM.users, id: \.self) { user in
                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: 31, height: 31)
                                    .foregroundColor(.gray)
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color("SearchBar"))
                                Text("WL")
                                    .font(.footnote)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .foregroundColor(.white)
                                    .font(.footnote)
                                
                                Text("@\(user.username)")
                                    .foregroundColor(.gray)
                                    .font(.footnote)

                            }
                            
                            Spacer()
                            
                            Button {
                                if !self.invitedUsers.contains(user) {
                                    self.invitedUsers.append(user)
                                } else {
                                    if let itemToRemoveIndex = invitedUsers.index(of: user) {
                                            invitedUsers.remove(at: itemToRemoveIndex)
                                    }
                                }
                            } label: {
                                // Already Invited
                                if self.invitedUsers.contains(user) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.blue)
                                            .frame(width: 100, height: 30)
                                        Text("Invited")
                                            .foregroundColor(.blue)
                                            .font(.caption)
                                            .padding()
                                    }
                                    .animation(.easeInOut)
                                    // Not Invited Yet
                                } else {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(Color("DarkBlue2"))
                                            .frame(width: 100, height: 30)
                                        Text("Invite User")
                                            .font(.caption)
                                            .foregroundColor(Color("LightBlue"))
                                            .padding()
                                    }
                                    .animation(.easeInOut)

                                }
                            }
                        }
                    }
                } else {
                    ForEach(self.invitedUsers, id: \.self) { user in
                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: 31, height: 31)
                                    .foregroundColor(.gray)
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color("SearchBar"))
                                Text("WL")
                                    .font(.footnote)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .foregroundColor(.white)
                                    .font(.footnote)
                                
                                Text("@\(user.username)")
                                    .foregroundColor(.gray)
                                    .font(.footnote)

                            }
                            
                            Spacer()
                            
                            Button {
                                if !self.invitedUsers.contains(user) {
                                    self.invitedUsers.append(user)
                                } else {
                                    if let itemToRemoveIndex = invitedUsers.index(of: user) {
                                            invitedUsers.remove(at: itemToRemoveIndex)
                                    }
                                }
                            } label: {
                                // Already Invited
                                if self.invitedUsers.contains(user) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.blue)
                                            .frame(width: 100, height: 30)
                                        Text("Invited")
                                            .foregroundColor(.blue)
                                            .font(.footnote)
                                            .padding()
                                    }
                                    .animation(.easeInOut)
                                    // Not Invited Yet
                                } else {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(Color("DarkBlue2"))
                                            .frame(width: 100, height: 30)
                                        Text("Invite User")
                                            .font(.footnote)
                                            .foregroundColor(Color("LightBlue"))
                                            .padding()
                                    }
                                    .animation(.easeInOut)

                                }
                            }
                        }
                    }
                }
                
            }
            
            Spacer()
            
            NavigationLink(destination: {
                Text("Add House Cover Photo")
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: UIScreen.main.bounds.maxX - 50, height: 60)
                        .foregroundColor(Color("LightBlue"))
                    Text("Continue")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10)
                        .foregroundColor(.black)
                        .padding(.trailing, 40)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
            })
                .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct AddHousematesScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddHousematesScreen()
    }
}
