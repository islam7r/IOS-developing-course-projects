//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
   
    @IBOutlet weak var progressView: UIProgressView!
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    let eggTime = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    
  
    var totalTime : Float = 0
    var secondpassed : Float = 0
    
    var timer = Timer()
    var hardness = "Soft"
   
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        
        
         hardness = sender.currentTitle!
        totalTime = Float(eggTime[hardness]!)
        
        progressView.progress = 0.0
        secondpassed = 0
        timerLabel.text = hardness
//        if (hardness == "Soft"){
//            print(softTime)
//        }
//        if (hardness == "Medium"){
//            print(mediumTime)
//        }
//        if (hardness == "Hard"){
//            print(hardTime)
//        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
                
        
//        switch hardness {
//        case "Soft":
//            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
//            print(eggTime["Soft"]!)
//        case "Medium":
//            print(eggTime["Medium"]!)
//            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
//        case "Hard":
//            print(eggTime["Hard"]!)
//            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
//        default:
//            print("Error")
//        }
        
      
        
    }
    
    
    @objc func updateCounter(){
        
        if secondpassed < totalTime {
            secondpassed += 1
            let percentageProgress = secondpassed / totalTime
            progressView.progress = percentageProgress
        }else{
            timer.invalidate()
            self.timerLabel.text = "Done"
            playSound()
        }
    }
   
    
//    @objc func updateCounterSoft() {
//        if counterSoft > 0 {
//            print(" the remaining time is \(counterSoft)")
//            counterSoft -= 1
//        }
//        
//    }
//    @objc func updateCounterMedium(){
//        if counterMedium > 0 {
//            print(" the remaining time is \(counterMedium)")
//            counterMedium -= 1
//        }
//    
//    }
//    @objc func updateCounterHard(){
//        if counterHard > 0 {
//            print(" the remaining time is \(counterHard)")
//            counterHard -= 1
//        }
//    }
    
    
    
    var player: AVAudioPlayer?

    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!

        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }

            player.prepareToPlay()
            player.play()

        } catch let error as NSError {
            print(error.description)
        }
    }


}
