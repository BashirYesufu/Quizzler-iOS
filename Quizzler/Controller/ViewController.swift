//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let answer = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if answer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        Timer.scheduledTimer(timeInterval: 0.2,
                             target: self,
                             selector: #selector(clearColors),
                             userInfo: nil,
                             repeats: false)
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
    
    @objc func clearColors() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
}

