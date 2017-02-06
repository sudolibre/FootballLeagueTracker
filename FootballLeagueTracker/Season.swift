//
//  Season.swift
//  FootballLeagueTracker
//
//  Created by Jonathon Day on 1/18/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation

class Season {
    var games: [Game] = []
    
    var jsonRepresentation: [String: Any] {
        let gamesAsJSON = games.map { $0.jsonRepresentation }
        return ["games": gamesAsJSON]
    }
    
    var teamStats: [(key: Team, value: TeamStats)] {
        var teamAndStats: [Team: TeamStats] = [:]
        
        //create dictionary with starting stats
        for game in games {
            let winner = game.homeTeam
            let loser = game.visitingTeam
            
            teamAndStats[winner] = TeamStats()
            teamAndStats[loser] = TeamStats()
        }
        
        // update stats for each team
        for game in games {
            if let winner = game.outcome?.winner,
                let loser = game.outcome?.loser {
                
                teamAndStats[winner]!.wins += 1
                teamAndStats[loser]!.loses += 1
                
            } else {
                teamAndStats[game.homeTeam]!.draws += 1
                teamAndStats[game.visitingTeam]!.draws += 1
            }
        }
        
        return teamAndStats.sorted { $0.0.value > $0.1.value }
    }
    
    init(games: [Game]) {
        self.games = games
    }
    
    init(jsonRepresentation: [String: Any]) {
        let jsonGames = jsonRepresentation["games"]! as! [[String: Any]]
        games = jsonGames.map { Game.init(jsonRep: $0) }
    }
    
}
