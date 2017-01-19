//
//  TeamDetailController.swift
//  FootballLeagueTracker
//
//  Created by Jonathon Day on 1/18/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation
import UIKit

class TeamDetailViewController: UIViewController {
    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var winsScoreTextLabel: UILabel!
    @IBOutlet var drawsScoreTextLabel: UILabel!
    @IBOutlet var losesScoreTextLabel: UILabel!
    
    
    var teamAndStats: (key: Team, value: TeamStats)!
    
    override func viewDidLoad() {
        teamNameLabel.text = teamAndStats.key.name
        winsScoreTextLabel.text = teamAndStats.value.wins.description
        drawsScoreTextLabel.text = teamAndStats.value.draws.description
        losesScoreTextLabel.text = teamAndStats.value.loses.description

    }
    
    
}
