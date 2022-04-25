//
//  OnboardingViewModel.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    @Published var tabSelection: Int = 0
    
    func incrementTab() {
        tabSelection = tabSelection + 1
    
    }
    
    func signupWithEmail() {
        
    }
}
