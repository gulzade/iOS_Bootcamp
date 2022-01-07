//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Gülzade Karataş on 7.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var hideTimer = Timer()
    var highScore = 0
    var kennyPossX = 0.0
    var kennyPossY = 0.0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    let kenny = UIImageView()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        scoreLabel.text = "Score: \(score)"
    
        kenny.frame = CGRect(x: highscoreLabel.frame.maxX, y: scoreLabel.frame.maxY, width: width/4, height: width/4)
        kenny.image = UIImage(named: "kenny.jpeg")
        view.addSubview(kenny)
        //Highscore check
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
                
        if storedHighScore == nil {
            highScore = 0
            highscoreLabel.text = "Highscore: \(highScore)"
        }
                
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highscoreLabel.text = "Highscore: \(highScore)"
        }
        kenny.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny.addGestureRecognizer(recognizer)
        
        //Timers
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeKenny), userInfo: nil, repeats: true)
        
        changeKenny()
    }
        
        @objc func changeKenny() {
            
            let random = Int(arc4random_uniform(UInt32(9)))

            kennyPossX = scoreLabel.frame.minX + 180.0 * (Double(random%2))
            kennyPossY = scoreLabel.frame.maxY + 20.0 + (Double(random/2) * kenny.frame.height)
            kenny.frame.origin.x = kennyPossX
            kenny.frame.origin.y = kennyPossY
            
        }
        
        
        @objc func increaseScore() {
            score += 1
            scoreLabel.text = "Score: \(score)"
        }
        
        @objc func countDown() {
            
            counter -= 1
            timeLabel.text = String(counter)
            
            if counter == 0 {
                timer.invalidate()
                hideTimer.invalidate()
                
                //HighScore
                
                if self.score > self.highScore {
                    self.highScore = self.score
                    highscoreLabel.text = "Highscore: \(self.highScore)"
                    UserDefaults.standard.set(self.highScore, forKey: "highscore")
                }
                
                
                //Alert
                
                let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                
                let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                    //replay function
                    
                    self.score = 0
                    self.scoreLabel.text = "Score: \(self.score)"
                    self.counter = 10
                    self.timeLabel.text = String(self.counter)
                    
                    
                    self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                    self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.changeKenny), userInfo: nil, repeats: true)
                }
                
                alert.addAction(okButton)
                alert.addAction(replayButton)
                self.present(alert, animated: true, completion: nil)
                
                
                
            }
            
        }

}

