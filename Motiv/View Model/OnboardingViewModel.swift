//
//  OnboardingViewModel.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import Foundation
import SwiftUI
import Firebase

@MainActor
class OnboardingViewModel: ObservableObject {
    
    @Published var tabSelection: Int = 0
    
    // MARK: UI/UX Flow Variables
    @Published var schoolSelected: Bool = false
    @Published var showSchools: Bool = false
    @Published var displaySchoolPage: Bool = false
    
    // MARK: Error Variables
    @Published var errorActive: Bool = false
    @Published var firebaseError: Bool = false
    @Published var errorMessage: String = ""
    
    // MARK: App Storage Variables (Permanent)
    @AppStorage("signedIn") var signedIn = false
    @AppStorage("inHouse") var inHouse = false
    
    // MARK: Login Variables
    @Published var loginEmail: String = ""
    @Published var loginPassword: String = ""
    
    // MARK: Create Account with Email Variables
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var program: String = "Select Program"
    @Published var password: String = ""
    @Published var reenterPassword: String = ""
    @Published var school: String = ""

    let titles = [
        "Welcome to Motiv",
        "Join or Create a House",
        "Party Hosting, Simplified"
    ]
    
    let captions = [
        "Never miss an event again. Join your friends\nand begin hosting and attending events now.",
        "Connect with housemates to plan and host events",
        "Streamlining the college event planning process"
    ]
    
    let buttonTitles = [
        "Get Started",
        "Continue",
        "Sign up with email"
    ]
    
    let programs: [String] = [
        "Engineering",
        "Sciences",
        "Commerce",
        "Arts",
        "Kinesiology",
        "Computer Science",
        "Socialogy",
        "Politics",
        "Economics",
        "English",
        "History",
        "Philosophy",
        "Law",
        "Biology",
        "Physics",
        "Psychology",
        "Visual Arts",
        "Con-Ed",
        "Education"
    ]
    
    // MARK: Allows
    func selectSchool() {
        
        self.schoolSelected = true
        self.showSchools.toggle()
        
    }
    
    // MARK: Changes the Initial 3 Onboarding Screens Text Values
    func incrementTab() {
        tabSelection += 1
    }
    
    // MARK: Authenticates and signs a user up with Firestore and Firebase Authentication
    func signupWithEmail() {
        
        var uid: String = "EMPTY_UID"
        
        self.errorDetection()
        
        if self.errorActive {
            return
        }
        
        let db = Firestore.firestore()
        
        // MARK: First step is authenticating user with Firebase Authentication
        Auth.auth().createUser(withEmail: self.email, password: self.password) { user, err in
            if let err = err {
                print("Error signing up user: \(err.localizedDescription)")
                
                // Avoids appending the same error in the case of repeating errors
                if self.errorMessage.contains("\n\(err.localizedDescription)") {
                    
                } else {
                    
                    self.errorMessage += self.errorMessage == "" ? "\(err.localizedDescription)" : "\n\(err.localizedDescription)"
                    
                }
                
                print("ACTIVATING ALERT FOR FIREBASE ERROR")
                self.errorActive = true
                return
                
            }
            
            print("\(user?.user.email ?? "NO EMAIL") has successfully been authenticated.")
            
        }
        
        uid = Auth.auth().currentUser?.uid ?? "ERROR_UID"
        
        db.collection("users").document(uid).setData([
            "name" : self.name,
            "username" : self.username,
            "email" : self.email,
            "program" : self.program,
            "school" : self.school,
            "uid" : uid
        ])
        
        print(self.username + "successfully entered the database.")
        
        self.signedIn = true
        
    }
    
    // MARK: Authentictes and signs a user up with Firestore and Firebase Authentication with Google
    func signupWithGoogle() {
        
    }
    
    // MARK: Authenticates and attempts to login user through Firebase Authentication
    func login() {
        print(self.loginEmail)
        print(self.loginPassword)
    }
    
    // MARK: Detects possible errors when signing up
    func errorDetection() {
        
        // MARK: Non-matching passwords error
        if self.password != self.reenterPassword {
            
            if self.errorMessage.contains("\nPasswords do not match") {
                
            } else {
                self.errorMessage += self.errorMessage == "" ? "Passwords do not match" : "\nPasswords do not match"
            }
            
            self.errorActive = true
            print("Error Detected")
        }
        
        // MARK: Empty Fields Error
        if self.name.isEmpty || self.email.isEmpty || self.program == "Select Program" || self.password.count < 6 || self.reenterPassword.count < 6 || self.username.isEmpty {
            
            if self.errorMessage.contains("\nMissing Fields") {
                
            } else {
                self.errorMessage += self.errorMessage == "" ? "Missing Fields" : "\nMissing Fields"
            }
            
            self.errorActive = true
            print("Error Detected")
        }
        
        
    }
    
    func signout() {
        self.signedIn = false
    }

}