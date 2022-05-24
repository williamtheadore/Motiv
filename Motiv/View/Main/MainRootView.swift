//
//  MainRootView.swift
//  Motiv
//
//  Created by William Little on 2022-05-17.
//

import SwiftUI

struct MainRootView: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    
    var body: some View {
        ZStack {
            
            if !rootVM.inHouse {
                
            }
            
            VStack {
                
                // MARK: Screen determination used with Tab enumeration
                switch rootVM.currentTab {
                case .map: MapScreen()
                        .blur(radius: rootVM.currentTab == .create  || rootVM.inHouse ? 3 : 0)
                case .activity: ActivityScreen()
                case .house: HouseScreen()
                        .blur(radius: rootVM.currentTab == .create  || rootVM.inHouse ? 3 : 0)
                case .user: UserScreen()
                        .blur(radius: rootVM.currentTab == .create  || rootVM.inHouse ? 3 : 0)
                default: MapScreen()
                }
                
                MainTabView()
            }
            .environmentObject(rootVM)
            .onAppear(perform: {
                rootVM.statusCheck()
            })
            .task {
                // MARK: Fetching user on background thread
                await self.rootVM.fetchCurrentUser()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BG"))
        }
    }
}

struct MainRootView_Previews: PreviewProvider {
    static var previews: some View {
        MainRootView()
    }
}
