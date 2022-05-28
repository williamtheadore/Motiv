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
    @Published var houseType: String = ""
    @Published var housemates: [String] = []
    @Published var friendsOnlyDisplay: Bool = true
    
    @AppStorage("signedIn") var signedIn: Bool = true
    
    // MARK: Determines if a user belongs to a house
    func determineInHouse() -> Bool {
        
        var inHouseCheck: Bool = false
                
        if let uid = Auth.auth().currentUser?.uid {
            Firestore.firestore().collection("users").document(uid).getDocument { doc, err in
                if let err = err {
                    print("Error retrieving user id \(uid) from Firestore: \(err.localizedDescription)")
                    self.signedIn = false
                } else {
                    let data = doc!.data()
                    
                    // MARK: Only true if user belongs to house
                    if let inHouse = data!["inHouse"] {
                        inHouseCheck = inHouse as? Bool ?? false
                    }
                }
            }
        } else {
            print("Unable to retrieve current signed in user")
            self.signedIn = false
        }
        
        return inHouseCheck
        
    }
    
}
