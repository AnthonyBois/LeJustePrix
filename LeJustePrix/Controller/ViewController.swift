//
//  ViewController.swift
//  LeJustePrix
//
//  Created by Anthony Bois on 30/01/2018.
//  Copyright © 2018 Bois Duval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game = Game()
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var questionView: QuestionView!
    //@IBOutlet weak var question: UILabel!
    
    @IBAction func didTapeNewGameButton() {
        startNewGame()
    }
    
    private func startNewGame() {
        let questionView = QuestionView()
        //questionView.title = game.currentQuestion()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
}


