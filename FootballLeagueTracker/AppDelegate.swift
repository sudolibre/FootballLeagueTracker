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
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let greenbay = Team(name: "Green Bay")
        let cowboys = Team(name: "Cowboys")
        let jets = Team(name: "jets")
        let falcons = Team(name: "falcons")
        let saints = Team(name: "saints")
        let giants = Team(name: "giants")
        
        let games: [Game] = [
            //giants will be fourth with one draw
            Game(homeTeam: giants,     visitingTeam: falcons,      homeTeamScore: 0,       visitingTeamScore: 0),
            //jets will be second with three wins
            Game(homeTeam:  jets,       visitingTeam: cowboys,      homeTeamScore: 14,      visitingTeamScore: 2),
            Game(homeTeam: jets,       visitingTeam: falcons,      homeTeamScore: 14,      visitingTeamScore: 2),
            Game(homeTeam: saints,     visitingTeam: jets,         homeTeamScore: 14,      visitingTeamScore: 22),
            //greenbay will have four wins and be first
            Game(homeTeam:  greenbay,   visitingTeam: cowboys,  homeTeamScore: 31,  visitingTeamScore: 26),
            Game(homeTeam: jets,       visitingTeam: greenbay, homeTeamScore: 12,  visitingTeamScore: 26),
            Game(homeTeam: greenbay,   visitingTeam: falcons,  homeTeamScore: 31,  visitingTeamScore: 12),
            Game(homeTeam: greenbay,   visitingTeam: giants,   homeTeamScore: 31,  visitingTeamScore: 12),
            //saints will be thrid with two wins
            Game(homeTeam: saints,     visitingTeam: giants,       homeTeamScore: 14,      visitingTeamScore: 2),
            Game(homeTeam: saints,     visitingTeam: falcons,      homeTeamScore: 14,      visitingTeamScore: 2),
            //falcons will just lose again and be second to last
            Game(homeTeam: giants,     visitingTeam: falcons,      homeTeamScore: 7,       visitingTeamScore: 0)
        ]
        
        let seasonStore = SeasonStore(games: games)
        
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

