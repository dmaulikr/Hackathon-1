//
//  AppDelegate.swift
//  GreenleafNetworkBaltimore

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let theme = ThemeManager.currentTheme()
        ThemeManager.applyTheme(theme: theme)
        
        return true
    }
    
}

