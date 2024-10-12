//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print(sender.currentTitle)
        sender.alpha = 0.5
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            
            sender.alpha = 1

           
            
        }
        
        playSound(theLetter: sender.currentTitle!)
    }
    
    
    
    func playSound(theLetter : String) {
        let url = Bundle.main.url(forResource: theLetter, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
       
        
        
       
                
    }
}
