//
//  MainTabView.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.maxX, height: 1)
                        .offset(y: -26)
                    HStack(spacing: 40) {
                        Image(systemName: "map")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 23)
                            .foregroundColor(Color("LightBlue"))
                            .onTapGesture(perform: {
                                self.rootVM.currentTab = .map
                            })
                            .environmentObject(rootVM)

                        
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 23)
                            .foregroundColor(Color("LightBlue"))
                            .onTapGesture(perform: {
                                self.rootVM.currentTab = .activity
                            })
                            .environmentObject(rootVM)

                        
                        
                        ZStack {
                            PlusCircle()
                                .offset(y: -14)
                                .onTapGesture(perform: {
                                    self.rootVM.currentTab = .create
                                })
                        }
                            .environmentObject(rootVM)

                        

                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 23)
                            .foregroundColor(Color("LightBlue"))
                            .onTapGesture(perform: {
                                self.rootVM.currentTab = .house
                            })
                            .environmentObject(rootVM)

                        
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 23)
                            .foregroundColor(Color("LightBlue"))
                            .onTapGesture(perform: {
                                self.rootVM.currentTab = .user
                            })
                            .environmentObject(rootVM)

                    }
                    .frame(width: UIScreen.main.bounds.maxX, height: 70)
                }
            }
            .padding(.bottom, 20)
            .edgesIgnoringSafeArea(.bottom)
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
