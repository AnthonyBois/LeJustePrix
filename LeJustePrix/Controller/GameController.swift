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
    
    var timer = Timer()
    var counter = 0.0
    var isRunning = false
    
    
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
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var suivant: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "\(counter)"
        startNewGame() //au lancement de la vue "game" on lance une partie
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func startCountdown(){
        if !isRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(GameController.updateTimer), userInfo: nil, repeats: true)
            isRunning = true
        }
    }
    
    @objc private func updateTimer(){
        counter -= 0.1
        timeLabel.text = String(format:"%.1f", counter)
    }
    

    public func startNewGame() {
        game.score = 0 //initialisation du score à 0
        // Cacher l'écran de fin
        endImg.isHidden = true
        endLogo.isHidden = true
        endScore.isHidden = true
        endPhrase.isHidden = true
        endButton.isHidden = true
        
        //cacher les images du niveau 6
        img1.isHidden = true
        img2.isHidden = true
        img3.isHidden = true
        img4.isHidden = true
        
        suivant.isHidden = true // cache le bouton niveau suivant
        
        nextLevel() //on commence une niveau
    }
    
    
    @IBAction func test(_ sender: UIButton) { //au clic du boutton envoyer
        if (saisie.text == "" || Int(saisie.text!) == nil){ //on vérifie si la saisie est bien un nombre
            aide.text = "entre un nombre"
        }
        else{
            let entre = Int(saisie.text!)! //convertir ce qui est entré en Int
            if(game.level == 9){
                if(entre == 9){   //si c'est le dernier niveau et que l'utilisateur à juste :
                    game.score += game.prix // on incrémente le score
                    finPartie()   // on fini la partie
                }
                else{
                    finPartie() // on fini la partie
                }
            }
                
                
                
            else if(game.level==3 || game.level==6){   //si c'est le niveau 3
                image.image = #imageLiteral(resourceName: "portail") // img du produit
                // on affiche les éléments des autres niveaux
                essai.isHidden = false
                txtMoins.isHidden = false
                txtPlus.isHidden = false
                txtEssai.isHidden = false
                image.isHidden = false
                // on cache les 4 produits
                img1.isHidden = true
                img2.isHidden = true
                img3.isHidden = true
                img4.isHidden = true
                image.image = #imageLiteral(resourceName: "portail") // img du produit
                if(entre == 3){   //si l'utilisateur à juste :
                    game.score += 800                    // on incrémente le score
                    aide.text = "Tu as juste !"       // on affiche un msg
                }
                else{
                    aide.text = "Hey non, c'était le portail !"       // on affiche un msg
                }
                
                game.level = game.level+1                  // on monte d'un niveau
                ecranIntermediaire() //affiche ecran intermediaire
            }
                
            else if(game.level==2 || game.level==5 || game.level==7){   //si c'est le niveau 3
                if(game.answerCurrentQuestion(entre: entre, prix: game.prix) == 1){ //si le prix entré est juste :
                    game.score += game.prix                    // on incrémente le score
                    aide.text = "Tu as juste !"       // on affiche un msg
                    game.level = game.level+1                  // on monte d'un niveau
                    timer.invalidate()
                    isRunning = false
                    ecranIntermediaire() //affiche ecran intermediaire
                    
                }
                    
                else if(game.answerCurrentQuestion(entre: entre, prix: game.prix) == 0){ //si le prix entré est plus petit on affiche un msg
                    aide.text = "C'est plus !"
                }
                else if(game.answerCurrentQuestion(entre: entre, prix: game.prix) == 2){ //si le prix entré est plus grand on affiche un msg
                    aide.text = "C'est moins !"
                }

                if(counter < 0.0){ // si le nombre d'essais est égal au nombre d'essais dispo :
                    game.level = game.level+1
                    timer.invalidate()
                    isRunning = false
                    aide.text = "Le prix était de "+String(game.prix)+" €"       // on affiche un msg
                    ecranIntermediaire() //affiche ecran intermediaire
                }

            }
                
            else{
                if(game.answerCurrentQuestion(entre: entre, prix: game.prix) == 1){ //si le prix entré est juste :
                    game.score += game.prix                    // on incrémente le score
                    aide.text = "Tu as juste !"       // on affiche un msg
                    game.level = game.level+1                  // on monte d'un niveau
                    
                    ecranIntermediaire() //affiche ecran intermediaire
                    
                }
                    
                else if(game.answerCurrentQuestion(entre: entre, prix: game.prix) == 0){ //si le prix entré est plus petit on affiche un msg
                    aide.text = "C'est plus !"
                }
                else if(game.answerCurrentQuestion(entre: entre, prix: game.prix) == 2){ //si le prix entré est plus grand on affiche un msg
                    aide.text = "C'est moins !"
                }
                game.nbrEssai = game.nbrEssai + 1 //au incrémente le nombre d'essais
                if(game.nbrEssai==game.essaiDispo){ // si le nombre d'essais est égal au nombre d'essais dispo :
                    game.level = game.level+1       // on monte d'un niveau
                    aide.text = "Hey non, le prix était de "+String(game.prix)+" €"       // on affiche un msg
                    ecranIntermediaire() //affiche ecran intermediaire
                }
                essai.text = String(game.nbrEssai)+"/"+String(game.essaiDispo) // on affiche le nomber d'essais dispo
            }
        }
    }
    
    @IBAction func changeLevel(_ sender: Any) { //au clic du bouton niveau suivant
        plus.isHidden = false
        moins.isHidden = false
        saisie.isHidden = false
        txtPlus.isHidden = false
        txtMoins.isHidden = false
        btnEnvoie.isHidden = false
        txtEssai.isHidden = false
        essai.isHidden = false
        aide.text = "Quel est le prix du produit ?"
        nextLevel()
    }
    
    public func nextLevel(){
        timeLabel.isHidden = true //cache le compte à rebourd
        suivant.isHidden = true // cache le bouton niveau suivant
        if(game.level == 1){ //Niveau 1 : 10 essais
            game.essaiDispo = 10 // on initialise le nombre d'essais dispo à 15
            niveauNbrEssais() // appel du niveau
        }
        else if(game.level == 2){ //Niveau 2 : moins de 40 sec
            timeLabel.isHidden = false
            counter = 40.0
            niveauTemps() // appel du niveau
        }
        else if(game.level == 3){ //Niveau 3 : objet le plus cher
            niveauGrand() // appel du niveau
        }
        else if(game.level == 4){ //Niveau 4 :  10 essais
            game.essaiDispo = 10 // on initialise le nombre d'essais dispo à 15
            niveauNbrEssais() // appel du niveau
        }
        else if(game.level == 5){ //Niveau 5 : moins de 30 sec
            timeLabel.isHidden = false
            counter = 30.0
            niveauTemps() // appel du niveau
        }
        else if(game.level == 6){ //Niveau 6 : quel objet appartien le prix
            niveauAppartien() // appel du niveau
        }
        else if(game.level == 7){ //Niveau 7 : moins de 30 sec
            timeLabel.isHidden = false
            counter = 20.0
            niveauTemps() // appel du niveau
        }
        else if(game.level == 8){  //Niveau 8 : moins de 5 essais
            game.essaiDispo = 5 // on initialise le nombre d'essais dispo à 10
            niveauNbrEssais() // appel du niveau
        }
        else if(game.level == 9){  //Niveau 9 : 1 chiffre faux
            game.essaiDispo = 10 // on initialise le nombre d'essais dispo à 10
            niveauChiffreFaux() // appel du niveau
        }
        
    }
    
    private func newProduct(){
        game.nbrEssai = 0 //initialisation du nombre d'essais à 0
        let produit = game.currentQuestion() // on recupere un produit
        game.prix = produit.prix // le prix du produit
        question.text = produit.libelle // nom du produit
        let img = produit.image // l'image du produit
        image.image = #imageLiteral(resourceName: img) // img du produit
        niveau.text = "Niveau "+String(game.level) //affiche le niveau
    }
    
    private func niveauNbrEssais(){
        newProduct()
        essai.text = String(game.nbrEssai)+"/"+String(game.essaiDispo) // affiche nombre essais
        // on affiche ou non les aides selon de niveau
        if(game.level == 1){
            let aideBas = (Double(game.prix)*1.8) // aide
            let aideHaut = (Double(game.prix)*0.3) // aide
            plus.text = String(aideHaut)+" €"
            moins.text = String(aideBas)+" €"
        }
        else{
            plus.isHidden = true
            moins.isHidden = true
            txtPlus.isHidden = true
            txtMoins.isHidden = true
        }
    }
    
    
    private func niveauTemps(){
        startCountdown()
        txtEssai.isHidden = true
        essai.isHidden = true
        newProduct()
        essai.text = String(game.nbrEssai)+"/"+String(game.essaiDispo) // affiche nombre essais
        // on affiche ou non les aides selon de niveau
        if(game.level == 2){
            let aideBas = (Double(game.prix)*1.8) // aide
            let aideHaut = (Double(game.prix)*0.3) // aide
            plus.text = String(aideHaut)+" €"
            moins.text = String(aideBas)+" €"
        }
        else{
            plus.isHidden = true
            moins.isHidden = true
            txtPlus.isHidden = true
            txtMoins.isHidden = true
        }
    }
    
    private func niveauChiffreFaux(){
        newProduct()
         aide.text = String(game.prix)+"9 € - Quel chiffre a été rajouté au prix?"
        //on cache ce qui est utile  pour les autres niveaux
        essai.isHidden = true
        txtMoins.isHidden = true
        txtPlus.isHidden = true
        txtEssai.isHidden = true
        moins.isHidden = true
        plus.isHidden = true
    }
    
    private func niveauGrand(){
        // onc cache les éléments des autres niveaux
        essai.isHidden = true
        txtMoins.isHidden = true
        txtPlus.isHidden = true
        moins.isHidden = true
        plus.isHidden = true

        txtEssai.isHidden = true
        image.isHidden = true
        question.text = ""
        // on affiche les 4 produits
        img1.isHidden = false
        img2.isHidden = false
        img3.isHidden = false
        img4.isHidden = false
        aide.text = "Quel est le produit le plus cher ?"
        niveau.text = "Niveau "+String(game.level) //affiche le niveau
    }
    
    private func niveauAppartien(){
        // onc cache les éléments des autres niveaux
        essai.isHidden = true
        txtMoins.isHidden = true
        txtPlus.isHidden = true
        txtEssai.isHidden = true
        image.isHidden = true
        moins.isHidden = true
        plus.isHidden = true
        // on affiche les 4 produits
        img1.isHidden = false
        img2.isHidden = false
        img3.isHidden = false
        img4.isHidden = false
        question.text = "800 €"
        aide.text = "À quel produit appartient le prix ?"
        niveau.text = "Niveau "+String(game.level) //affiche le niveau
    }
    
    @IBAction func rejouer(_ sender: Any) { //si on clic sur rejouer
        game.level = 1 //niveau à 1
        game.nbrEssai = 1 //nbre essais à 1
        // on affiche les éléments du jeu
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
        startNewGame() // on commence une nouvelle partie
    }
    
    private func finPartie(){ //ecran de fin de partie
        //on affiche l'écran de fin
        aide.text = ""
        endImg.isHidden = false
        endLogo.isHidden = false
        endScore.isHidden = false
        endPhrase.isHidden = false
        endButton.isHidden = false
        // on cache le éléments du jeu
        question.isHidden = true
        image.isHidden = true
        niveau.isHidden = true
        essai.isHidden = true
        aide.isHidden = true
        plus.isHidden = true
        moins.isHidden = true
        saisie.isHidden = true
        txtPlus.isHidden = true
        txtMoins.isHidden = true
        btnEnvoie.isHidden = true
        txtEssai.isHidden = true
        
        endScore.text = String(game.score)+" €" // on affiche le score du joureur
        
    }
    
    private func ecranIntermediaire(){
        // cache les éléments du jeu
        essai.isHidden = true
        plus.isHidden = true
        moins.isHidden = true
        saisie.isHidden = true
        txtPlus.isHidden = true
        txtMoins.isHidden = true
        btnEnvoie.isHidden = true
        txtEssai.isHidden = true
        suivant.isHidden = false // affiche le bouton niveau suivant
    }

}
