//
//  SeasonStore.swift
//  FootballLeagueTracker
//
//  Created by Jonathon Day on 1/18/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation

class SeasonStore {
    var season: Season
    
    init(games: [Game] = []) {
        self.season = Season(games: games)
    }
}
