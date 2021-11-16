//
//  AppDelegate.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/16/21.
//

import UIKit
import IQKeyboardManager
import Alamofire

var isNetworkReachable = NetworkReachability.shared.isReachable

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //MARK:- Keyboard
        IQKeyboardManager.shared().isEnabled = true
        
        //MARK:- Network Manager
        NetworkReachability.shared.startListening()
        NotificationCenter.default.addObserver(self, selector: #selector(self.checkInternetStatus(notification:)), name: Notification.Name("notifyIntetnetStatus"), object: nil)
        
        return true
    }

    @objc func checkInternetStatus(notification: Notification) {
        let isConeected = notification.object as? Bool ?? false
        if isConeected {
            isNetworkReachable = true
        }else{
            isNetworkReachable = false
        }
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

