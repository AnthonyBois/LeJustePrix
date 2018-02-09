//
//  Game.swift
//  LeJustePrix
//
//  Created by Anthony Bois on 01/02/2018.
//  Copyright © 2018 Bois Duval. All rights reserved.
//

import Foundation

class Game {

    private var currentIndex = 0 //
    
    var level = 1 //niveau
    var nbrEssai = 1 // essais restants
    var score = 0 //score
    var prix = 0 //prix du produit
    var essaiDispo = 0 //essais dispo pour la partie

    //fonction recuppere une question au hasard
    public func currentQuestion()-> Product {
        let questions = Question()
        let randomIndex = Int(arc4random_uniform(UInt32(questions.products.count)))
        let question = (questions.products[randomIndex])
        return question
    }

    //fonction qui véréfie si la réponse est juste
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
        return (reponseJuste) //return 0 pour "moins", 1 pour "juste" et 2 pour "trop"
    }
}

