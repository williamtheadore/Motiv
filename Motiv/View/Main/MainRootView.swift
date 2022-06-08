//
//  MainRootView.swift
//  Motiv
//
//  Created by William Little on 2022-05-17.
//

import SwiftUI

struct MainRootView: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    @State private var showingSheet = false
    @StateObject var houseVM = HouseViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                //                VStack {
                
                // MARK: Screen determination used with Tab enumeration
                switch rootVM.currentTab {
                case .map: MapScreen()
                    //                            .blur(radius: rootVM.currentTab == .create  || rootVM.inHouse ? 0 : 3)
                case .activity: ActivityScreen()
                    //                            .blur(radius: rootVM.currentTab == .create  || rootVM.inHouse ? 0 : 3)
                case .house: HouseScreen()
                    //                            .blur(radius: rootVM.currentTab == .create  || rootVM.inHouse ? 0 : 3)
                case .user: UserScreen()
                    //                            .blur(radius: rootVM.currentTab == .create  || rootVM.inHouse ? 0 : 3)
                default: MapScreen()
                }
                
                MainTabView()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                
        
            }
            .sheet(isPresented: $houseVM.displayHouseOnboarding) {
                       
            } content: {
                NavigationView {
                    HouseOptionSheetView()
                        .environmentObject(houseVM)
                }
            }
                .environmentObject(rootVM)
                .onAppear(perform: {
                    
                    // MARK: Determine user sign in status
                    rootVM.statusCheck()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        // MARK: Will display house options 5 seconds after appearing if user is not in house
                        houseVM.determineInHouse()
                    }
                })
                .task {
                    // MARK: Fetching user on background thread to allow for rest of view to load
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

