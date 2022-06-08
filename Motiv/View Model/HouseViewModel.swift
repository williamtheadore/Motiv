//
//  HouseViewModel.swift
//  Motiv
//
//  Created by William Little on 2022-05-28.
//

import Foundation
import Firebase
import SwiftUI

class HouseViewModel: ObservableObject {
    
    @Published var createHouseName: String = ""
    @Published var createHouseType: String = ""
    @Published var housemates: [String] = []
    @Published var friendsOnlyDisplay: Bool = true
    @Published var displayHouseOnboarding: Bool = false
    
    @AppStorage("signedIn") var signedIn: Bool = true
    @AppStorage("displayHouseOnboarding") var alreadyDisplayedOnboarding: Bool = false
    
    // MARK: Determines if a user belongs to a house
    func determineInHouse() {
                        
        if let uid = Auth.auth().currentUser?.uid {
            Firestore.firestore().collection("users").document(uid).getDocument { doc, err in
                if let err = err {
                    print("Error retrieving user id \(uid) from Firestore: \(err.localizedDescription)")
                    self.signedIn = false
                } else {
                    let data = doc!.data()
                    
                    // MARK: Only true if user belongs to house
                    if let inHouse = data!["inHouse"] {
                        if inHouse as? Bool ?? false == true {
                            print("House onboarding not required")
                            self.displayHouseOnboarding = false
                            return
                        }
                    } else {
                        if !self.alreadyDisplayedOnboarding {
                            self.displayHouseOnboarding = true
                        }
                    }
                }
            }
        } else {
            print("Unable to retrieve current signed in user")
            self.signedIn = false
        }
        
//        if !self.alreadyDisplayedOnboarding {
            self.displayHouseOnboarding = true
            print("Displaying house onboarding")
//        }
    }
    
}
