//
//  ViewController.swift
//  bhikarsavkar
//
//  Created by Karan Kadam on 8/1/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!

    @IBOutlet weak var leftCardView: UIImageView!
    @IBOutlet weak var rightCardView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    @IBOutlet weak var winLabel: UILabel!
    
    var playerScore: Int = 0
    var cpuScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Intialisation
        rightScoreLabel.text = String(cpuScore)
        leftScoreLabel.text = String(playerScore)
        winLabel.text = ""
    }
    
    
    @IBAction func dealTap(_ sender: Any) {
        // Generate random numbers for card draw
        let leftCardNumber = Int.random(in: 2...14)
        let rightCardNumber = Int.random(in: 2...14)
        
        // Set win label to false
        winLabel.text = ""
        
        // Deal cards
        leftCardView.image = UIImage(named: "card\(leftCardNumber)")
        rightCardView.image = UIImage(named: "card\(rightCardNumber)")
        
        // Play sound effects
        playShuffleSound()
        
        // Update the score labels
        updateScores(leftCardNumber, rightCardNumber)
    }
    
    func updateScores(_ leftCardNumber: Int,_ rightCardNumber: Int) -> Void {
        // CPU won this round
        if rightCardNumber > leftCardNumber {
            cpuScore += 1
            rightScoreLabel.text = String(cpuScore)
        }
        
        // Player won this round
        if leftCardNumber > rightCardNumber {
            playerScore += 1
            leftScoreLabel.text = String(playerScore)
        }
        
        if playerScore == 32 {
            playerWon()
        }
        
        if cpuScore == 32 {
            cpuWon()
        }
    }
    
    func cpuWon() {
        // CPU reached a score of 32 first
        playDefeatSound()
        
        // Reset scores
        playerScore = 0
        cpuScore = 0
        rightScoreLabel.text = String(cpuScore)
        leftScoreLabel.text = String(playerScore)
        
        // Show defeat label
        winLabel.text = "Sorry, CPU won!"
    }
    
    func playerWon() {
        // Player reached a score of 32 first
        playVictorySound()
        
        // Reset scores
        playerScore = 0
        cpuScore = 0
        rightScoreLabel.text = String(cpuScore)
        leftScoreLabel.text = String(playerScore)
        
        // Show victory label
        winLabel.text = "Well done, you won!"
    }
    
    // Functions to play various sounds in the game
    func playShuffleSound() {
        let path = Bundle.main.path(forResource: "shuffle.wav", ofType: nil)!
        playSound(path)
    }
    
    func playVictorySound() {
        let path = Bundle.main.path(forResource: "victory.wav", ofType: nil)!
        playSound(path)
    }
    
    func playDefeatSound() {
        let path = Bundle.main.path(forResource: "defeat.wav", ofType: nil)!
        playSound(path)
    }
    
    func playSound(_ path: String) {
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        catch {
            // Could not load music file
            print("Error: Failed to load audio file \(path)!")
        }
    }
    

}

