//
//  SignupViewModel.swift
//  Motiv
//
//  Created by William Little on 2022-05-15.
//

import Foundation
import Firebase
import SwiftUI

class AuthService: ObservableObject {
    
    @AppStorage("signedIn") var signedIn: Bool = false
    @AppStorage("loading") var loading: Bool = false
     
    // MARK: Error handling
    @Published var errorActive: Bool = false
    @Published var errorMsg: signupError = .unknown
    
    // MARK: Firebase
    private var db = Firestore.firestore()
    
    // MARK: User sign up variables
    @Published var fullName: String = ""
    @Published var username: String = ""
    @Published var school: String = ""
    @Published var program: String = ""
    @Published var phoneNumber: String = ""
    
    // MARK: Determines error message
    enum signupError: Error {
        case phoneAuth
        case unknown
    }
        
    func phoneAuth(phNo: String) {
        
        PhoneAuthProvider.provider()
            .verifyPhoneNumber("+1\(self.phoneNumber)", uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print("Error authorizing phone number: \(error.localizedDescription)")
                    return
                }
                
                print("SMS Message Sent to \(self.phoneNumber)")
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                return
            }
    }
    
    // MARK: FULL USER SIGNUP WITH AUTHENTICATION AND FIRESTORE
    func signInWithPhone(verificationCode: String) {
                
        // MARK: Retrieves VerID from user defaults in case of app closure
        // During app sign in process
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else {
            print("Unable to find verificationID for Firebase Phone Authentication")
            return
        }
        
        // MARK: Initializes Firebase Authentication Credential
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode
        )
        
        // MARK: Firebase Authentication Sign in
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print("Error signing in with phone number authentication: \(error.localizedDescription)")
                
                self.errorActive = true
                self.errorMsg = .phoneAuth
            }
            
            self.loading = true
            
            guard let uid = Auth.auth().currentUser?.uid else {
                print("Error retrieving user UID")
                self.loading = false
                return
            }
                         
            // MARK: Firestore upload
            DispatchQueue.main.async {
                self.db.collection("users").document(uid).getDocument { doc, err in
                    
                    // MARK: Determine if user exists in database already
                    if let err = err {
                        print("User already has an account")
                        self.signedIn = true
                        self.loading = false
                        return
                        
                    } else {
                        
                       // MARK: User does not exist in database and requires account creation
                        self.db.collection("users").document(uid).setData([
                            "uid" : uid,
                            "fullName" : self.fullName,
                            "username" : self.username,
                            "school" : self.school,
                            "program" : self.program,
                            "phoneNumber" : self.phoneNumber,
                            "houseID" : "",
                            "inHouse" : false
                        ])
                        
                        self.signedIn = true
                        print("Successfully signed in user")
                        self.loading = false
                        return
                    }
                }
            }
        }
    }
    
}
