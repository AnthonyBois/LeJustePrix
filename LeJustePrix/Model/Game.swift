//
//  Game.swift
//  LeJustePrix
//
//  Created by Anthony Bois on 01/02/2018.
//  Copyright © 2018 Bois Duval. All rights reserved.
//

import Foundation

class Game {

    private var currentIndex = 0
    
    var state: State = .ongoing
    
    enum State {
        case ongoing, over
    }
    
    public func currentQuestion()-> Product {
        let questions = Question()
        let randomIndex = Int(arc4random_uniform(UInt32(questions.products.count)))
        let question = (questions.products[randomIndex])
        return question
    }

    
    func answerCurrentQuestion(entre:Int, prix:Int)-> Int {
        var reponseJuste = 0
        if (entre > prix) {
            reponseJuste=2
            
        }
        else if (entre == prix){
            reponseJuste=1
        }
        else{
            reponseJuste=0
        }
        return (reponseJuste)
    }
}

