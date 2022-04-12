//
//  AppDelegate.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import UIKit
import Firebase
import FirebaseFirestore
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            window = UIWindow(frame: UIScreen.main.bounds)
                   let vc = ViewController()
                   let navigationController = UINavigationController(rootViewController: vc)
                   window?.rootViewController = navigationController
                   window?.makeKeyAndVisible()
            
            FirebaseApp.configure()
            let db = Firestore.firestore()
            print("Hola \(db)")
            
            IQKeyboardManager.shared.enable = true
            IQKeyboardManager.shared.shouldResignOnTouchOutside = true
            IQKeyboardManager.shared.enableAutoToolbar = true
            return true
            
        }
}

