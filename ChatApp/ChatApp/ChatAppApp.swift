//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Matthew Wong on 2023-09-06.
//

import SwiftUI
import Firebase
//import FirebaseCore
//import FirebaseFirestore

@main
struct ChatAppApp: App {
    // register app delegate for Firebase setup
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
