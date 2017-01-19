//
//  TeamStats.swift
//  FootballLeagueTracker
//
//  Created by Jonathon Day on 1/18/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation

struct TeamStats: Equatable, Comparable {
    var wins: Int = 0
    var draws: Int = 0
    var loses: Int = 0
    
    static func ==(_ lhs: TeamStats, _ rhs: TeamStats) -> Bool {
        return (lhs.wins, lhs.draws, lhs.loses) == (rhs.wins, rhs.draws, rhs.loses)
    }
    
    static func <(_ lhs: TeamStats, _ rhs: TeamStats) -> Bool {
        return (lhs.wins, lhs.draws, lhs.loses) < (rhs.wins, rhs.draws, rhs.loses)
    }
}
