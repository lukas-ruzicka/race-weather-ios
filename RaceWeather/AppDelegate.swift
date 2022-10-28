//
//  AppDelegate.swift
//  RaceWeather
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

import Firebase
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
