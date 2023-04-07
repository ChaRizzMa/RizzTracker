//
//  AppDelegate.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 3/7/23.
//

import UIKit
import ParseSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) async -> Bool {
        // Override point for customization after application launch.
        
        do {
            try await ParseSwift.initialize(applicationId: "Y32c4ltK4bXQum9JAhtF4lNmiWv8Qy6jGTxbpelq", clientKey: "R0ylHbxfi8YdxyhL1eSIJCsnncaVi1giXcSvDWwI", serverURL: URL(string: "https://parseapi.back4app.com")!)
        } catch let error {
            debugPrint(error)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

