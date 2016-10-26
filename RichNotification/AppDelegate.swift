//
//  AppDelegate.swift
//  RichNotification
//
//  Created by MobileFirst Applications on 13/10/16.
//  Copyright © 2016 MobileFirst Applications. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let center = UNUserNotificationCenter.current()
        
        
        let actionLike = UNNotificationAction(identifier: ActionType.like.rawValue, title: "Like", options: [.foreground])
        let actionReply = UNNotificationAction(identifier: ActionType.reply.rawValue, title: "Reply", options: [.destructive,.foreground,.authenticationRequired])
        
        let actions = [actionLike, actionReply]
        let categoryOptions = UNNotificationCategoryOptions(rawValue: 0)
        
        let actionCategory = UNNotificationCategory(identifier: NotificationType.action.rawValue, actions: actions, intentIdentifiers: [], options: categoryOptions)
        
        center.setNotificationCategories(Set([actionCategory]))
        center.requestAuthorization(options: [.badge, .alert , .sound]) { (greanted, error) in
            print(error)
        }
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

