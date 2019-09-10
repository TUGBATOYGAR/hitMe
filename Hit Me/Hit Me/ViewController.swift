//
//  ViewController.swift
//  Hit Me
//
//  Created by TT on 22.08.2019.
//  Copyright © 2019 TT. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var targetScore = 0
    var totalScore = 0
    var currentValue = 0
    var round = 0
    
    
    
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var targetBoard: UILabel!
    
    @IBOutlet weak var scoreBoard: UILabel!
    
    @IBOutlet weak var roundBoard: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let roundedValue = slider1.value.rounded()
        currentValue = Int(roundedValue)
        
        startNewRound()
       
    }
    
    @IBAction func hitMe(_ sender: UIButton) {
        
        let difference = abs(targetScore-currentValue)
        let points = 100-difference
        totalScore += points
     
        
        let message = "You scored \(points) points"
        
        if (difference == 0){
            title = "Perfect!"
        }else if(difference <= 20 ){
            title = "Good."
        }else if(difference > 20 ){
            title = "Do It Better."
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func slider(_ slider: UISlider) {
        let roundedValue = slider1.value.rounded()
        currentValue = Int(roundedValue)
        
    }
    
    func startNewRound(){
        targetScore = Int.random(in: 0...100)
        currentValue=50
        slider1.value=Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels(){
        targetBoard.text=String(targetScore)
        scoreBoard.text=String(totalScore)
        roundBoard.text=String(round)
    }
    @IBAction func undoButton(_ undo: UIButton) {
        targetBoard.text=String(targetScore)
        scoreBoard.text="0"
        totalScore=0
        roundBoard.text = "1"
        
    }
    
    @IBAction func infoButton(_ info: UIButton) {
    }
 
}

