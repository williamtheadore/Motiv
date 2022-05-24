//
//  UserScreen.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//

import SwiftUI

struct UserScreen: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    
    enum UserTab {
        case grid
        case house
    }
    
    @State var user  = User(id: "", name: "", username: "", program: "", school: "", friends: [], requests: [], houseUID: "", profilePhoto: "")
    
    @State private var currentTab: UserTab = .grid
    
    var body: some View {
        if rootVM.userScreenLoading {
            ProgressView()
        } else {
            VStack {
                
                // MARK: Extras, Username, and Notifications
                HStack(spacing: 75) {
                    
                    // MARK: Three Dots
                    HStack(spacing: 4) {
                        Circle()
                            .frame(width: 4, height: 4)
                            .foregroundColor(.white)
                        Circle()
                            .frame(width: 4, height: 4)
                            .foregroundColor(.white)
                        Circle()
                            .frame(width: 4, height: 4)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    
                    // MARK: Username
                    Text(rootVM.signedInUser.username)
                        .foregroundColor(.white)
                        .font(.footnote)
                    
                    // MARK: Notifications
                    NavigationLink(destination: {
                        NotificationsScreen()
                    }, label: {
                        Image(systemName: "bell")
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(width: 20)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 20)
                    })
                    
                }
                .padding(.top, 7.5)
                .padding(.bottom, 20)
                
                
                // MARK: Profile Photo, Friends, Motiv's
                HStack {
                    
                    // MARK: Mock Profile Photo for Testing
                    ZStack {
                        Circle()
                            .frame(width: 91, height: 91)
                            .foregroundColor(.black)
                        Circle()
                            .frame(width: 90, height: 90)
                            .foregroundColor(.gray)
                        Text("WL")
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    .padding(.trailing)
                    
                    // MARK: Friends
                    NavigationLink(destination: {
                        FriendsScreen()
                    }, label: {
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("DarkBlue"))
                                .frame(width: 100, height: 60)
                                .shadow(color: Color.black.opacity(0.4), radius: 2, y: 2)
                            
                            VStack() {
                                
                                Text("32")
                                    .foregroundColor(Color("LightBlue"))
                                    .fontWeight(.semibold)
                                
                                Text("Friends")
                                    .foregroundColor(.white)
                                    .font(.footnote)
                            }
                            
                        }
                        .padding(5)
                    })
                    
                    
                    // MARK: Motiv's
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("DarkBlue"))
                            .frame(width: 100, height: 60)
                            .shadow(color: Color.black.opacity(0.4), radius: 2, y: 2)
                        
                        
                        VStack {
                            Text("6")
                                .foregroundColor(Color("LightBlue"))
                                .fontWeight(.semibold)
                            
                            Text("Motiv's")
                                .foregroundColor(.white)
                                .font(.footnote)
                        }
                    }
                    .padding(.trailing, 15)
                }
                .padding(.vertical, 10)
                
                // MARK: Name, Username, School, and Program
                HStack {
                    
                    // MARK: Name and Username
                    VStack(alignment: .leading) {
                        Text(rootVM.signedInUser.name)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("@\(rootVM.signedInUser.username)")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 15)
                    
                    Spacer()
                    
                    // MARK: School and Program
                    VStack(alignment: .trailing) {
                        Text(rootVM.signedInUser.school)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                        Text(rootVM.signedInUser.program)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 15)
                    
                }
                
                // MARK: Edit Profile Button
                NavigationLink(destination: {
                    EditProfileScreen()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: UIScreen.main.bounds.maxX - 25, height: 35)
                            .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: UIScreen.main.bounds.maxX - 26, height: 34)
                            .foregroundColor(Color("BG"))
                        Text("Edit Profile")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                    .padding(.vertical, 15)
                })
                
                
                
                Text("This is my unique bio")
                    .foregroundColor(.white)
                    .fontWeight(.light)
                
                HStack {
                    VStack {
                        Button(action: {
                            self.currentTab = .grid
                        }, label: {
                            Image(systemName: "square.grid.2x2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                        })
                        
                        GeometryReader { reader in
                            if self.currentTab == .grid {
                                Rectangle()
                                    .frame(width: reader.size.width, height: 2)
                                    .foregroundColor(Color("LightBlue"))
                            }
                        }
                    }
                    
                    // MARK: Grid or House View Selection
                    VStack {
                        Button(action: {
                            self.currentTab = .house
                        }, label: {
                            Image(systemName: "house")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                        })
                        
                        GeometryReader { reader in
                            if self.currentTab == .house {
                                Rectangle()
                                    .frame(width: reader.size.width, height: 2)
                                    .foregroundColor(Color("LightBlue"))
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}

struct GeometryReaderCentered<Content: View>: View {
    var content: (GeometryProxy) -> Content

    var body: some View {
        GeometryReader { geometry in
            Group {
                content(geometry)
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
            )
        }
    }
}

struct UserScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserScreen()
    }
}
