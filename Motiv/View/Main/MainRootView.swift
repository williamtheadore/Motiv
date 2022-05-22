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
        VStack {
            
            // MARK: Screen determination used with Tab enumeration
            switch rootVM.currentTab {
            case .map: MapScreen()
                    .environmentObject(rootVM)
            case .activity: ActivityScreen()
                    .environmentObject(rootVM)
            case .create: CreatePreview()
                self.blur(radius: 5)
            case .house: HouseScreen()
                    .environmentObject(rootVM)
            case .user: UserScreen()
                    .environmentObject(rootVM)
            }
        
            MainTabView()
                .environmentObject(rootVM)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
    }
}

struct MainRootView_Previews: PreviewProvider {
    static var previews: some View {
        MainRootView()
    }
}
