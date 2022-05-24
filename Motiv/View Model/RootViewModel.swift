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
    @AppStorage("inHouse") var inHouse: Bool = false

    // MARK: UI/UX Variables
    @Published var currentTab: Tab = .map
    @Published var userScreenLoading: Bool = false

    // MARK: Signed In User
    @Published var signedInUser = User(id: "", name: "", username: "", program: "", school: "", friends: [], requests: [], houseUID: "", profilePhoto: "" )
    @Published var uid: String = ""
    
    
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
    
    // MARK: Retrieves signed in user information from Firestore
    func fetchCurrentUser() async {
                
        DispatchQueue.main.async {
            
            self.userScreenLoading = true
            
            if let uid = Auth.auth().currentUser?.uid {
                
                print("Current signed in user UID: \(uid)")
                
                self.db.collection("users").document(uid).getDocument { doc, err in
                    if let err = err {
                        print("Error fetching user \(uid) from Firestore: \(err.localizedDescription)")
                        self.userScreenLoading = false
                    } else {
                        
                        // MARK: Determine user data then add to a user
                        if doc != nil {
                            let data = doc!.data()
                            
                            print("FOUND USER: \(data?["fullName"] ?? "NONE")")
                            
                            self.signedInUser = User(id: data?["uid"] as? String ?? "",
                                        name: data?["fullName"] as? String ?? "",
                                        username: data?["username"] as? String ?? "",
                                        program: data?["program"] as? String ?? "",
                                        school: data?["school"] as? String ?? "",
                                        friends: data?["friends"] as? [String] ?? [],
                                        requests: data?["requests"] as? [String] ?? [],
                                        houseUID: data?["houseUID"] as? String ?? "",
                                        profilePhoto: data?["profilePhoto"] as? String ?? "")
                            
                            self.userScreenLoading = false
                        } else {
                            print("Error: user is nil")
                            self.userScreenLoading = false
                        }
                    }
                }
            } else {
                print("No user currently signed in")
                self.signedIn = false
                self.userScreenLoading = false
            }
        }
    }
    
    
    // MARK: Fetches signed in user UID
    func fetchCurrentUserUID(completion: @escaping (_ uid: String) -> ()) {
        
        DispatchQueue.main.async {
            if var uid = Auth.auth().currentUser?.uid {
                completion(uid)
            } else {
                completion("Error")
            }
        }
    }
    
    func statusCheck() {
        
        if let uid = Auth.auth().currentUser?.uid {
            self.signedIn = true
        } else {
            self.signedIn = false
        }
        
    }
}
