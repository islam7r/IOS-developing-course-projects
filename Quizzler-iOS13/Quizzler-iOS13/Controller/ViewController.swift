//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var question1: UIButton!
    @IBOutlet weak var question2: UIButton!
    @IBOutlet weak var question3: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var timer = Timer()
    
    
    var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //        questionLabel.text = quizArray[questionNumber]
        // Do any additional setup after loading the view.
        progressView.progress = 0.0
        updateUI()
    }
    
    
    var quizBrain = QuizBrain()
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
//        if questionNumber + 1 < quizArray.count{
//            questionNumber += 1
//            progressView.progress = Float(questionNumber) / Float(quizArray.count)
//            
//        }else{
//            questionNumber = 0
//            progressView.progress = 1.0
//        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
        
        
        
    }
    
    
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        progressView.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore()) "
        
        question1.setTitle(quizBrain.quizArray[quizBrain.questionNumber].answer[0], for: UIControl.State.normal)
        question2.setTitle(quizBrain.quizArray[quizBrain.questionNumber].answer[1], for: UIControl.State.normal)
        question3.setTitle(quizBrain.quizArray[quizBrain.questionNumber].answer[2], for: UIControl.State.normal)
//        question1 = quizBrain.quizArray[quizBrain.questionNumber].answer[1]
//        question2 = quizBrain.quizArray[quizBrain.questionNumber].answer[2]
//        question3 = quizBrain.quizArray[quizBrain.questionNumber].answer[3]
        self.question1.backgroundColor = UIColor.clear
        self.question2.backgroundColor = UIColor.clear
        self.question3.backgroundColor = UIColor.clear

        
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        //            self.trueButton.backgroundColor = UIColor.clear
        //            self.falseButton.backgroundColor = UIColor.clear
        //                }
        
        
        
    }
    
    
    
}

