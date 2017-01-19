//
//  FootballLeagueTrackerTests.swift
//  FootballLeagueTrackerTests
//
//  Created by Jonathon Day on 1/18/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import XCTest
@testable import FootballLeagueTracker

class FootballLeagueTrackerTests: XCTestCase {
    
    func testGameOutcome() {
        let greenbay = Team(name: "Green Bay")
        let cowboys = Team(name: "Cowboys")
        let game = Game(homeTeam: greenbay, visitingTeam: cowboys, homeTeamScore: 31, visitingTeamScore: 26)
        XCTAssertEqual(game.outcome!.winner, greenbay)
        XCTAssertEqual(game.outcome!.loser, cowboys)
        
        let gameDraw = Game(homeTeam: greenbay, visitingTeam: cowboys, homeTeamScore: 31, visitingTeamScore: 31)
        XCTAssertNil(gameDraw.outcome?.winner)
        XCTAssertNil(gameDraw.outcome?.loser)
    }
    
    func testSeasonTeamStats() {
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
        
        let season = Season(games: games)
        
        let expected = [
            (key: greenbay, value: TeamStats(wins: 4, draws: 0, loses: 0)),
            (key: jets, value: TeamStats(wins: 3, draws: 0, loses: 1)),
            (key: saints, value: TeamStats(wins: 2, draws: 0, loses: 1)),
            (key: giants, value: TeamStats(wins: 1, draws: 1, loses: 2)),
            (key: falcons, value: TeamStats(wins: 0, draws: 1, loses: 4)),
            (key: cowboys, value: TeamStats(wins: 0, draws: 0, loses: 2)),
            ]
        
        let result = season.teamStats
        XCTAssertTrue(expected.map{$0.key} == result.map{$0.key})
        XCTAssertTrue(expected.map{$0.value} == result.map{$0.value})
    }
    
    
}
