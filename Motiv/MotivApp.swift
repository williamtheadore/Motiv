//
//  MotivApp.swift
//  Motiv
//
//  Created by William Little on 2022-04-25.
//

import SwiftUI
import Firebase

@main
struct MotivApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

