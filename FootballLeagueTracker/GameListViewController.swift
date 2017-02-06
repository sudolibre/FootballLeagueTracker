//
//  GameListViewController.swift
//  FootballLeagueTracker
//
//  Created by Jonathon Day on 1/18/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation
import UIKit

class GameListViewController: UITableViewController {
    @IBAction func addGame(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newGameVC = storyBoard.instantiateViewController(withIdentifier: "newGame") as! NewGameController
        newGameVC.onSave = { [weak self] (game) in
            if let strongSelf = self {
            strongSelf.dataSource.addGame(game)
            _ = strongSelf.navigationController?.popViewController(animated: true)
            }
        }
        show(newGameVC, sender: UIBarButtonItem.self)
    }
    var seasonStore: SeasonStore!
    var dataSource: GameListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = GameListDataSource(seasonStore: seasonStore)
        dataSource.registerCellForTableView(tableView)
        tableView.dataSource = dataSource
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let game = dataSource.games[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let gameDetailVC = storyBoard.instantiateViewController(withIdentifier: "gameDetail") as! GameDetailController
        gameDetailVC.game = game
        gameDetailVC.onEdit = { [weak self] in
                _ = self?.navigationController?.popToRootViewController(animated: true)
            }
        show(gameDetailVC, sender: self)
    }
    
}

class GameListDataSource: NSObject, UITableViewDataSource {
    private let seasonStore: SeasonStore
    
    var games: [Game]
    
    internal func addGame(_ game: Game) {
        seasonStore.season.games.append(game)
        games = seasonStore.season.games
    }
    
    
    func registerCellForTableView(_ tableview: UITableView) {
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "gameCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell")!
        let game = games[indexPath.row]
        
        cell.textLabel!.text = "\(game.homeTeam.name) vs. \(game.visitingTeam.name)"
        return cell
    }
    
    init(seasonStore: SeasonStore) {
        self.games = seasonStore.season.games
        self.seasonStore = seasonStore
    }
    
}
