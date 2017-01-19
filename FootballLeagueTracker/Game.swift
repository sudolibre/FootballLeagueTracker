//
//  Game.swift
//  LeagueTracker
//
//  Created by Jonathon Day on 1/17/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation

class Game {
    internal var homeTeam: Team
    internal var homeTeamScore: Int

    internal var visitingTeam: Team
    internal var visitingTeamScore: Int
    
    var jsonRepresentation: [String: Any] {
        return [
            "homeTeam" : homeTeam.jsonRepresentation,
            "homeTeamScore" : homeTeamScore,
            "visitingTeam" : visitingTeam.jsonRepresentation,
            "visitingTeamScore" : visitingTeamScore
        ]
    }
    
    var outcome: (winner: Team, loser: Team)? {
        if homeTeamScore > visitingTeamScore {
            return (homeTeam, visitingTeam)
        } else if homeTeamScore < visitingTeamScore {
            return (visitingTeam, homeTeam)
        } else {
            return nil
        }
    }
    
    init(homeTeam: Team, visitingTeam: Team, homeTeamScore: Int, visitingTeamScore: Int) {
        self.homeTeam = homeTeam
        self.visitingTeam = visitingTeam
        self.homeTeamScore = homeTeamScore
        self.visitingTeamScore = visitingTeamScore
        
    }
    
    init(jsonRep: [String: Any]) {
        self.homeTeam = Team(jsonRep: jsonRep["homeTeam"] as! [String : Any])
        self.homeTeamScore = jsonRep["homeTeamScore"] as! Int
        self.visitingTeamScore = jsonRep["visitingTeamScore"] as! Int
        self.visitingTeam = Team(jsonRep: jsonRep["visitingTeam"] as! [String : Any])
    }

}
