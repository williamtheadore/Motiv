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
    
    @Published var errorActive: Bool = false
    @Published var errorMsg: signupError = .unknown
    
    // MARK: Determines error message
    enum signupError: Error {
        case phoneAuth
        case unknown
    }
        
    func phoneAuth(phNo: String) {
        
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phNo, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print("Error authorizing phone number: \(error.localizedDescription)")
                    return
                }
                
                print("SMS Message Sent to \(phNo)")
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                return
            }
    }
    
    func signInWithPhone(verificationCode: String) {
        
        // MARK: Retrieves VerID from user defaults in case of app closure
        // During app sign in process
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else {
            return
        }
        
        // MARK: Initializes Firebase Authentication Credential
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode
        )
        
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print("Error signing in with phone number authentication: \(error.localizedDescription)")
                
                self.errorActive = true
                self.errorMsg = .phoneAuth
                return
            }
            
            self.signedIn = true
            print("Successfully signed in user")
        }
    }
    
}
