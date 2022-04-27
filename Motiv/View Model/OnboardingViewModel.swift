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
    
    @Published var tabSelection: Int = 0
    
    // MARK: UI/UX Flow Variables
    @Published var schoolSelected: Bool = false
    @Published var showSchools: Bool = false
    
    // MARK: Error Variables
    @Published var emptyFieldError: Bool = false
    @Published var passwordsMatchError: Bool = false
    @Published var firebaseError: String = ""
    @Published var errorMessage: String = "Error:"
    
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
        
        DispatchQueue.main.async {
            self.schoolSelected = true
            self.showSchools.toggle()
        }
        
    }
    
    // MARK: Changes the Initial 3 Onboarding Screens Text Values
    func incrementTab() {
        tabSelection += 1
    }
    
    // MARK: Authenticates and signs a user up with Firestore and Firebase Authentication
    func signupWithEmail() {
        

        
        Auth.auth().createUser(withEmail: self.email, password: self.password) { user, err in
            if let err = err {
                print("Error signing up: \(err.localizedDescription)")
                self.firebaseError = err.localizedDescription
                return
            }
            
            print("\(user?.user.email ?? "NO EMAIL") has signed up succesfully.")
        }
        
    }
    
    // MARK: Authentictes and signs a user up with Firestore and Firebase Authentication with Google
    func signupWithGoogle() {
        
    }
    
    // MARK: Authenticates and attempts to login user through Firebase Authentication
    func login() {
        print(self.loginEmail)
        print(self.loginPassword)
    }
    
    // MARK:
    func errorDetection() {
        
        if password != reenterPassword {
            
        }
        
    }

}
