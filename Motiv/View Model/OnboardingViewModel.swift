//
//  OnboardingViewModel.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import Foundation
import SwiftUI
import Firebase

class OnboardingViewModel: ObservableObject {
    
    // MARK: User sign up variables
    @Published var fullName: String = ""
    @Published var username: String = "@"
    @Published var school: String = ""
    @Published var program: String = ""
    @Published var phoneNumber: String = ""
    
    // MARK: App Storage Variables
    @AppStorage("loading") var loading: Bool = false
    
    // MARK: Firebase Services
    private let db = Firestore.firestore()
    private let auth = Auth.auth()
    
    func dbSignUp() {
        
        self.loading = true
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Error retrieving user UID")
            return
        }
        
        let currDate: Date = Date.now
        
        db.collection("users").document(uid).setData([
            "uid" : uid,
            "dateCreated" : currDate,
            "fullName" : self.fullName,
            "username" : self.username,
            "school" : self.school,
            "program" : self.program,
            "phoneNumber" : self.phoneNumber
        ])
        
        self.loading = false

    }
    
}
