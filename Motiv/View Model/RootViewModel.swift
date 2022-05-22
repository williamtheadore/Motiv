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
    
    // MARK: App Storage Variables
    @AppStorage("signedIn") var signedIn: Bool = false
    @AppStorage("loading") var loading: Bool = false
    @AppStorage("onboardingComplete") var onboardingComplete: Bool = false
    
    // MARK: UI/UX Variables
    @Published var currentTab: Tab = .map
    
    // MARK: Firebase Variables
    private let db = Firestore.firestore()
    
    func signout() {
        
        self.loading = true
        
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing user out: \(error.localizedDescription)")
            return
        }
        
        self.signedIn = false
        self.onboardingComplete = false
        self.loading = false
        print("Succesfully signed out")
        return
    }
    
    // MARK: Retrieves a single user information from Firestore
    func fetchUserData(uid: String) -> User? {
        
        var user: User?
        
        DispatchQueue.main.async {
            self.db.collection("users").document(uid).getDocument { doc, err in
                
                if let err = err {
                    print("Error fetching user \(uid) from Firestore: \(err.localizedDescription)")
                    user = nil
                }
                
                // MARK: Determine user data then add to a user
                
                if doc != nil {
                    let data = doc!.data()
                    
                    user = User(id: data?["uid"] as? String ?? "",
                                dateCreated: data?["dateCreated"] as! [String],
                                name: data?["fullName"] as? String ?? "",
                                username: data?["username"] as? String ?? "",
                                program: data?["program"] as? String ?? "",
                                school: data?["school"] as? String ?? "",
                                friends: data?["friends"] as? [String] ?? [],
                                requests: data?["requests"] as? [String] ?? [],
                                houseUID: data?["houseUID"] as? String ?? "",
                                profilePhoto: data?["profilePhoto"] as? String ?? "")
                }
            }
        }
        return user
    }
}
