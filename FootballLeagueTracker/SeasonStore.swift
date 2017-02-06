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
    
    internal func saveJSONToDisk() {
        let seasonData = try! JSONSerialization.data(withJSONObject: season.jsonRepresentation, options: [])
        let fileURL = URL.init(fileURLWithPath: "/Users/noj/Code/TIY/FootballLeagueTracker/jsonSeason.txt")
        try! seasonData.write(to: fileURL, options: .atomic)
    }
    
    init(games: [Game] = []) {
        self.season = Season(games: games)
    }
    
    
    init(jsonData: Data) {
        let seasonRepresentation = try! JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
        season = Season(jsonRepresentation: seasonRepresentation)
    }
}
