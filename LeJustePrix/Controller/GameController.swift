//
//  GameController.swift
//  LeJustePrix
//
//  Created by Anthony Bois on 06/02/2018.
//  Copyright © 2018 Bois Duval. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    var game = Game()
    private var level = 1
    private var nbrEssai = 1
    var score = 0
    var prix = 0
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var niveau: UILabel!
    @IBOutlet weak var essai: UILabel!
    @IBOutlet weak var plus: UILabel!
    @IBOutlet weak var moins: UILabel!

    @IBOutlet weak var txtPlus: UILabel!
    @IBOutlet weak var txtMoins: UILabel!
    @IBOutlet weak var btnEnvoie: UIButton!
    @IBOutlet weak var txtEssai: UILabel!
    
    @IBOutlet weak var saisie: UITextField!
    @IBOutlet weak var aide: UILabel!
    
    @IBOutlet weak var endPhrase: UILabel!
    @IBOutlet weak var endScore: UILabel!
    @IBOutlet weak var endImg: UIImageView!
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var endLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    public func startNewGame() {
        score = 0
        endImg.isHidden = true
        endLogo.isHidden = true
        endScore.isHidden = true
        endPhrase.isHidden = true
        endButton.isHidden = true
        
        let produit = game.currentQuestion()
        prix = produit.prix
        let img = produit.image
        let aideBas = (Double(prix)*1.8)
        let aideHaut = (Double(prix)*0.3)
        question.text = produit.libelle
        image.image = #imageLiteral(resourceName: img)
        niveau.text = "Niveau 1"
        essai.text = String(nbrEssai)+"/15"
        plus.text = String(aideHaut)+" €"
        moins.text = String(aideBas)+" €"
        
    }
    
    @IBAction func test(_ sender: UIButton) {
        let entre = Int(saisie.text!)!
        
        if(game.answerCurrentQuestion(entre: entre, prix: prix) == 1){
            score += prix
            aide.text = "tu gagnes !!"
            if(level == 11){
                finPartie()
            }
            else{
                level = level+1
                nextLevel()
            }
        }
            
        else if(game.answerCurrentQuestion(entre: entre, prix: prix) == 0){
            aide.text = "C'est plus !"
        }
        else if(game.answerCurrentQuestion(entre: entre, prix: prix) == 2){
            aide.text = "C'est moins !"
        }
        nbrEssai = nbrEssai + 1
        if(nbrEssai==15){
            if(level == 10){
                finPartie()
            }
            else{
                level = level+1
                nextLevel()
            }
        }
        essai.text = String(nbrEssai)+"/15"
    }
    
    public func nextLevel(){
        nbrEssai = 1
        let produit = game.currentQuestion()
        prix = produit.prix
        let img = produit.image
        let aideBas = (Double(prix)*1.8)
        let aideHaut = (Double(prix)*0.3)
        question.text = produit.libelle
        image.image = #imageLiteral(resourceName: img)
        niveau.text = "Niveau "+String(level)
        essai.text = String(nbrEssai)+"/15"
        plus.text = String(aideHaut)+" €"
        moins.text = String(aideBas)+" €"
        
    }
    
    @IBAction func rejouer(_ sender: Any) {
        level = 1
        nbrEssai = 1
        question.isHidden = false
        image.isHidden = false
        niveau.isHidden = false
        essai.isHidden = false
        plus.isHidden = false
        moins.isHidden = false
        saisie.isHidden = false
        aide.isHidden = false
        txtPlus.isHidden = false
        txtMoins.isHidden = false
        btnEnvoie.isHidden = false
        txtEssai.isHidden = false
        startNewGame()
    }
    
    private func finPartie(){
        aide.text = "FINI"
        endImg.isHidden = false
        endLogo.isHidden = false
        endScore.isHidden = false
        endPhrase.isHidden = false
        endButton.isHidden = false
        
        question.isHidden = true
        image.isHidden = true
        niveau.isHidden = true
        essai.isHidden = true
        plus.isHidden = true
        moins.isHidden = true
        saisie.isHidden = true
        aide.isHidden = true
        txtPlus.isHidden = true
        txtMoins.isHidden = true
        btnEnvoie.isHidden = true
        txtEssai.isHidden = true
        
        endScore.text = String(score)+" €"
        
    }

}
