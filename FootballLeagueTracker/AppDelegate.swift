//
//  AppDelegate.swift
//  FootballLeagueTracker
//
//  Created by Jonathon Day on 1/18/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var seasonStore: SeasonStore!

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //retrieve a SeasonStore from disk or create a new one
        let fileURL = URL(fileURLWithPath: "/Users/noj/Code/TIY/FootballLeagueTracker/jsonSeason.txt")
        let seasonFromFile = try? Data(contentsOf: fileURL)
        if let seasonFile = seasonFromFile {
            seasonStore = SeasonStore(jsonData: seasonFile)
        } else {
            seasonStore = SeasonStore()
        }
        
        //share the SeasonStore with the top level view controllers
        let tabBarVC = window?.rootViewController! as! UITabBarController
        let gamesNavController = tabBarVC.viewControllers![0] as! UINavigationController
        let teamsNavController = tabBarVC.viewControllers![1] as! UINavigationController

        let gamesList = gamesNavController.viewControllers[0] as! GameListViewController
        let teamList = teamsNavController.viewControllers[0] as! TeamListViewController
        
        gamesList.seasonStore = seasonStore
        teamList.seasonStore = seasonStore

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        seasonStore.saveJSONToDisk()
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

