//
//  Game.swift
//  LeJustePrix
//
//  Created by Anthony Bois on 01/02/2018.
//  Copyright © 2018 Bois Duval. All rights reserved.
//

import Foundation

class Game {
    
    var score = 0
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
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
    }
    
    func answerCurrentQuestion(entre:Int, prix:Int)-> Int {
        var reponseJuste = 0
        if (entre > prix) {
            print("trop grand")
            reponseJuste=2
            
        }
        else if (entre == prix){
            print("tu gagnes")
            score += prix
            reponseJuste=1
        }
        else{
            print("trop petit")
            reponseJuste=0
        }
        print(score)
        return reponseJuste
        //goToNextQuestion()
    }
    
   /* private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }*/
    
    private func finishGame() {
        state = .over
    }
}

