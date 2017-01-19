//
//  NewGameController.swift
//  FootballLeagueTracker
//
//  Created by Jonathon Day on 1/18/17.
//  Copyright © 2017 dayj. All rights reserved.
//

import Foundation
import UIKit

class NewGameController: UIViewController, UITextFieldDelegate {
    @IBOutlet var homeTeamNameTextField: UITextField!
    @IBOutlet var visitingTeamNameTextField: UITextField!
    @IBOutlet var homeTeamScoreField: UITextField!
    @IBOutlet var visitingTeamScoreField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    var game: Game?
    
    @IBAction func saveTapped(_ sender: UIButton) {
        let homeTeam = Team(name: homeTeamNameTextField.text!)
        let visitingTeam = Team(name: visitingTeamNameTextField.text!)
        let homeTeamScore = Int(homeTeamScoreField.text!)!
        let visitingTeamScore = Int(visitingTeamScoreField.text!)!
        if let existingGame = game {
            existingGame.homeTeam = homeTeam
            existingGame.visitingTeam = visitingTeam
            existingGame.homeTeamScore = homeTeamScore
            existingGame.visitingTeamScore = visitingTeamScore
            onEdit?()
        } else {
        game = Game(homeTeam: homeTeam, visitingTeam: visitingTeam, homeTeamScore: homeTeamScore, visitingTeamScore: visitingTeamScore)
        onSave?(game!)
        }
    }
    
    var onEdit: (() -> ())?
    var onSave: ((Game) -> ())?
    var onLoad: (() -> ())?
    
    var saveEnabled: Bool {
        guard let homeTeamScoreText = homeTeamScoreField.text,
            let visitingTeamScoreText = visitingTeamScoreField.text,
            let homeTeamNameText = homeTeamNameTextField.text,
            let visitingTeamNameText = visitingTeamNameTextField.text,
            Int(homeTeamScoreText) != nil,
            Int(visitingTeamScoreText) != nil
            else {
                return false
        }
        return !homeTeamNameText.isEmpty && !visitingTeamNameText.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        saveButton.adjustsImageWhenDisabled = true
        onLoad?()
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if saveEnabled { saveButton.isEnabled = true }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func tapDetected(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
