//
//  AppDelegate.swift
//  Login
//
//  Created by Beytullah Özer on 24.03.2022.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        rememberUser()
        
        configureWindow(destinationVC: LoginVC())
        
        return true
    }

    
    func configureWindow(destinationVC : UIViewController){

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        window?.rootViewController = LoginVC()



    }
    
    
    func rememberUser(){

        if uDefaults.object(forKey: "user") != nil{


            if Auth.auth().currentUser != nil{

                fetchClients()
                fetchUserProfile()
                configureWindow(destinationVC: LoginVC())

            }else{

                configureWindow(destinationVC: LoginVC())

            }


        }else{

            configureWindow(destinationVC: Onboarding1VC())

        }
    }
    
    
    



}

