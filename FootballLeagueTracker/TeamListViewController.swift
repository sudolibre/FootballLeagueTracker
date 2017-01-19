//
//  TeamListViewController.swift
//  FootballLeagueTracker
//
//  Created by Jonathon Day on 1/18/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation
import UIKit

class TeamListViewController: UITableViewController {
    var seasonStore: SeasonStore!
    var dataSource: TeamListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = TeamListDataSource(seasonStore: seasonStore)
        dataSource.registerCellForTableView(tableView)
        tableView.dataSource = dataSource
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let teamDetailVC = storyBoard.instantiateViewController(withIdentifier: "teamDetail") as! TeamDetailViewController
        teamDetailVC.teamAndStats = dataSource.teamStats[indexPath.row]
        show(teamDetailVC, sender: self)
    }
    
}

class TeamListDataSource: NSObject, UITableViewDataSource {
    var teamStats: [(key: Team, value: TeamStats)]
    
    func registerCellForTableView(_ tableview: UITableView) {
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "teamCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamStats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell")!
        let teamName = teamStats[indexPath.row].key.name
        
        cell.textLabel!.text = teamName
        return cell
    }
    
    init(seasonStore: SeasonStore) {
        self.teamStats = seasonStore.season.teamStats
    }
    
}
