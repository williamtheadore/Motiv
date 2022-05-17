//
//  RootViewModel.swift
//  Motiv
//
//  Created by William Little on 2022-04-27.
//

import Foundation
import Firebase
import SwiftUI

class RootViewModel: ObservableObject {
    
    @AppStorage("signedIn") var signedIn: Bool = false
    @AppStorage("loading") var loading: Bool = false
    
    // MARK: ta
    enum Tab {
        case map
        case activity
        case plus
        case home
        case user
    }
    
    var currentTab: Tab = .map
    
    func signout() {
        
        self.loading = true
        
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing user out: \(error.localizedDescription)")
            return
        }
        
        self.signedIn = false
        self.loading = false
        print("Succesfully signed out")
        return
    }
    
}
