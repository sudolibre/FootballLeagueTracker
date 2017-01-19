//
//  GameDetailController.swift
//  FootballLeagueTracker
//
//  Created by Jonathon Day on 1/18/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation
import UIKit

class GameDetailController: UIViewController {
    @IBOutlet var homeTeamNameLabel: UILabel!
    @IBOutlet var homeTeamScoreLabel: UILabel!
    @IBOutlet var visitingTeamNameLabel: UILabel!
    @IBOutlet var visitingTeamScoreLabel: UILabel!
    
    var onEdit: (() -> ())?
    
    @IBAction func editTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newGameVC = storyBoard.instantiateViewController(withIdentifier: "newGame") as! NewGameController
        newGameVC.onEdit = onEdit
        newGameVC.game = game
        newGameVC.onLoad = {
        newGameVC.homeTeamNameTextField.text = self.game.homeTeam.name
        newGameVC.visitingTeamNameTextField.text = self.game.visitingTeam.name
        newGameVC.homeTeamScoreField.text = self.game.homeTeamScore.description
        newGameVC.visitingTeamScoreField.text = self.game.visitingTeamScore.description
        }
        show(newGameVC, sender: UIBarButtonItem.self)
    }
    
    var game: Game!
    
    override func viewDidLoad() {
        updateView()
    }
    override func viewDidAppear(_ animated: Bool) {
        updateView()
    }
    
    func updateView() {
        homeTeamNameLabel.text = game.homeTeam.name
        visitingTeamNameLabel.text = game.visitingTeam.name
        homeTeamScoreLabel.text = game.homeTeamScore.description
        visitingTeamScoreLabel.text = game.visitingTeamScore.description
    }

}
