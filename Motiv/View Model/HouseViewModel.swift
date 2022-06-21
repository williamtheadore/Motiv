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
    @Published var phoneNumbersToSend: [String] = []
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
    
    // MARK: Sends Notifications to existing users and invite links to phone numbers of non-existing users
    func addHousemates(phNoList: [String], UIDList: [String]) {
        
        let collection = Firestore.firestore().collection("houseInvites")
        
        // Sends SMS messages to each phone number
        for phNo in phNoList {
            collection.addDocument(data: [
                "to" : "+15067541078",
                "body" : "Your housemates invited you to join the house 79 Nelly on Motiv. https://motivappinc.page.link/open"
            ])
        }
        
        for UID in UIDList {
            
        }
        
    }
    
}
