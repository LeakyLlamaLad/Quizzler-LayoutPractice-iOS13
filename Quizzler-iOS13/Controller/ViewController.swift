//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var scoreLable: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //check for correct answer
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green //answer is correct
        } else {
            sender.backgroundColor = UIColor.red //answer is wrong
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLable.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress() //updates progress bar
        scoreLable.text = "Score: \(quizBrain.getScore())"
        //change button lable to the question choices
        choice1Button.setTitle(quizBrain.getChoiceText(choiceNum: 1), for: .normal)
        choice2Button.setTitle(quizBrain.getChoiceText(choiceNum: 2), for: .normal)
        choice3Button.setTitle(quizBrain.getChoiceText(choiceNum: 3), for: .normal)
        //clear button background colors
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
    }
    
}
