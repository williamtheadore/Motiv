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
    @EnvironmentObject var houseVM: HouseViewModel
    @FocusState private var keyboardActive: Bool

    @State private var invitedUsers: [UserContact] = []
    @State private var phNoList: [String] = []
    @State private var UIDList: [String] = []
    
    // MARK: Profile Photo initials
    func findUserInitials(name: String) -> String {
        
        // USED FOR DETERMINING QUANTITY OF INITIALS IN FULL NAME
        let fullNameArr = name.components(separatedBy: " ")
        print("Amount of words in full name: \(fullNameArr.count)")
        // ONE INTITIAL
        if fullNameArr.count == 1 {
                        
            let firstName = fullNameArr[0]
            print("Single intital name: \(fullNameArr)")
            
            if firstName.count >= 1 {
                return String(firstName[firstName.startIndex])
            } else {
                return ""
            }
            
        } else { // TWO INITIALS
                    
            let firstName: String = fullNameArr[0]
            let lastName: String = fullNameArr[1]
            
            if firstName.count >= 1 && lastName.count >= 1 {
                let firstInitial = String(firstName[firstName.startIndex])
                let lastIntitial = String(lastName[lastName.startIndex])
                print("More than one intial: \(fullNameArr)")
                return String(firstInitial + lastIntitial)
            } else {
                print("Single intital name: \(fullNameArr)")
                return String(firstName[firstName.startIndex])
            }
        }
    }
    
    func sendInvites() {
        
        for user in invitedUsers {
            if user.contact {
                self.phNoList.append(user.phoneNo ?? "")
            } else {
                self.UIDList.append(user.id)
            }
        }
        
        self.houseVM.addHousemates(phNoList: self.phNoList, UIDList: self.UIDList)
    }
    
    init() {
        self.keyboardActive = false
    }
    
    var body: some View {
        VStack(alignment: .center) {
            
            // MARK: Back button and Add
            HStack {
                
                // TODO: Return to previous page
                Image(systemName: "chevron.left")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 10, height: 20)
                    .padding(.horizontal)
                
                Spacer()

                Text("Add Housemates")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .offset(x: -20)
                
                Spacer()

                
            }
            .padding(.top, 25)
            
            // MARK: Search Bar
            ZStack {
                Rectangle()
                    .foregroundColor(Color("SearchBar"))
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search ..", text: $indexVM.searchText)
                        .foregroundColor(.white)
                        .focused($keyboardActive)
                }
                .foregroundColor(.gray)
                .padding(.leading, 13)

            }
            .frame(height: 50)
            .cornerRadius(15)
            .padding(.top, 10)
            .padding(.horizontal)
            
            // MARK: Users List
            List {
                if self.indexVM.searchText != "" {
                    ForEach(self.indexVM.searchedUsers, id: \.self) { user in
                        
                        let initials: String? = findUserInitials(name: user.name)
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.gray)
                                Circle()
                                    .frame(width: 34, height: 34)
                                    .foregroundColor(Color("SearchBar"))
                                Text(initials ?? "?")
                                    .font(.footnote)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .foregroundColor(.white)
//                                    .font(.footnote)
                                
                                
                                if user.descriptionOrName == "FROM YOUR CONTACTS" {
                                    Text("CONTACT")
                                        .foregroundColor(Color("LightBlue"))
                                        .fontWeight(.semibold)
                                        .font(.footnote)
                                } else {
                                    Text("@\(user.descriptionOrName)")
                                        .foregroundColor(.gray)
                                        .font(.footnote)
                                }
                                
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
                        
                        let initials: String? = findUserInitials(name: user.name)

                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: 31, height: 31)
                                    .foregroundColor(.gray)
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color("SearchBar"))
                                Text(initials ?? "")
                                    .font(.footnote)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .foregroundColor(.white)
//                                    .font(.footnote)
                                
                                if user.descriptionOrName == "FROM YOUR CONTACTS" {
                                    Text("CONTACT")
                                        .foregroundColor(Color("LightBlue"))
                                        .fontWeight(.semibold)
                                        .font(.footnote)
                                } else {
                                    Text("@\(user.descriptionOrName)")
                                        .foregroundColor(.gray)
                                        .font(.footnote)
                                }

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
            
            // MARK: Send Invites Button
            if !keyboardActive {
                
                NavigationLink(destination: {
                    HouseCoverPhoto()
                        .environmentObject(houseVM)
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
                    .onTapGesture {
                        self.sendInvites()
                    }
                })

            } else {
                
            }
            
            
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
