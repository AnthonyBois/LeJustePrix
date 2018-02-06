//
//  QuestionView.swift
//  LeJustePrix
//
//  Created by Anthony Bois on 01/02/2018.
//  Copyright © 2018 Bois Duval. All rights reserved.
//

import UIKit
var title:String? = "123"
class QuestionView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var niveau: UILabel!
    @IBOutlet weak var essai: UILabel!
    @IBOutlet weak var plus: UILabel!
    @IBOutlet weak var moins: UILabel!

    

    public func changeTitle(title : String){
        
        question.text = title
    }
    
     /*var title = "" {
        didSet {
            question!.text = "title"
        }
    }
    
   var img = #imageLiteral(resourceName: "logo") {
        didSet {
            image.image = img
        }
    }
    
    var texteNiveau = "" {
        didSet {
            niveau.text = texteNiveau
        }
    }
    
    var texteEssai = "" {
        didSet {
            essai.text = texteEssai
        }
    }
    
    var textePlus = "" {
        didSet {
            plus.text = textePlus
        }
    }
    
    var texteMoins = "" {
        didSet {
            moins.text = texteMoins
        }
    }*/
    
}
