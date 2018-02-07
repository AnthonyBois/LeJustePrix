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
    var essaiDispo = 0
    
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
        
        nextLevel()
        
    }
    
    @IBAction func test(_ sender: UIButton) {
        if (saisie.text == "" || Int(saisie.text!) == nil){
            aide.text = "entre un nombre"
        }
        else{
            
            let entre = Int(saisie.text!)!
            if(level == 9){
                if(entre == 9){
                    score += prix
                    finPartie()
                }
                else{
                    finPartie()
                }
            }
            else{
                if(game.answerCurrentQuestion(entre: entre, prix: prix) == 1){
                    score += prix
                    aide.text = "tu gagnes !!"
                    level = level+1
                    nextLevel()
                    
                }
                    
                else if(game.answerCurrentQuestion(entre: entre, prix: prix) == 0){
                    aide.text = "C'est plus !"
                }
                else if(game.answerCurrentQuestion(entre: entre, prix: prix) == 2){
                    aide.text = "C'est moins !"
                }
                nbrEssai = nbrEssai + 1
                if(nbrEssai==essaiDispo){
                    level = level+1
                    nextLevel()
                    
                }
                essai.text = String(nbrEssai)+"/"+String(essaiDispo)
            }
            
        }
        
        
    }
    
    public func nextLevel(){
        if(level == 1){ //Niveau 1 : 15 essais
            essaiDispo = 15
            niveauNbrEssais()
        }
        else if(level == 2){ //Niveau 2 : moins de 2 minutes
            niveauTemps()
        }
        else if(level == 3){ //Niveau 3 : objet le plus cher
            niveauTemps()
        }
        else if(level == 4){ //Niveau 4 : moins 15 essais
            essaiDispo = 15
            niveauNbrEssais()
        }
        else if(level == 5){ //Niveau 5 : moins de 1 minutes 30
            niveauTemps()
        }
        else if(level == 6){ //Niveau 6 : quel objet appartien le prix
            niveauTemps()
        }
        else if(level == 7){ //Niveau 7 : moins de 1 minute
            niveauTemps()
        }
        else if(level == 8){  //Niveau 8 : moins de 10 essais
            essaiDispo = 10
            niveauNbrEssais()
        }
        else if(level == 9){  //Niveau 9 : 1 chiffre faux
            essaiDispo = 10
            niveauChiffreFaux()
        }
        
    }
    
    private func niveauNbrEssais(){
        nbrEssai = 0
        let produit = game.currentQuestion()
        prix = produit.prix
        let img = produit.image
        let aideBas = (Double(prix)*1.8)
        let aideHaut = (Double(prix)*0.3)
        question.text = produit.libelle
        image.image = #imageLiteral(resourceName: img)
        niveau.text = "Niveau "+String(level)
        essai.text = String(nbrEssai)+"/"+String(essaiDispo)
        if(level == 1){
            plus.text = String(aideHaut)+" €"
            moins.text = String(aideBas)+" €"
        }
        else{
            plus.text = ""
            moins.text = ""
        }
        
        
    }
    private func niveauTemps(){
        nbrEssai = 0
        let produit = game.currentQuestion()
        prix = produit.prix
        let img = produit.image
        let aideBas = (Double(prix)*1.8)
        let aideHaut = (Double(prix)*0.3)
        question.text = produit.libelle
        image.image = #imageLiteral(resourceName: img)
        niveau.text = "Niveau "+String(level)
        essai.text = String(nbrEssai)+"/15"
        if(level == 2){
            plus.text = String(aideHaut)+" €"
            moins.text = String(aideBas)+" €"
        }
        else{
            plus.text = ""
            moins.text = ""
        }
    }
    
    private func niveauChiffreFaux(){
        nbrEssai = 0
        let produit = game.currentQuestion()
        prix = produit.prix
        let img = produit.image
        question.text = produit.libelle
        aide.text = String(prix)+"9 € - Quel chiffre du prix a été rajouté ?"
        image.image = #imageLiteral(resourceName: img)
        niveau.text = "Niveau "+String(level)
        essai.isHidden = true
        txtMoins.isHidden = true
        txtPlus.isHidden = true
        txtEssai.isHidden = true
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
        aide.text = ""
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
