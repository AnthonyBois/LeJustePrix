//
//  QuestionView.swift
//  LeJustePrix
//
//  Created by Anthony Bois on 01/02/2018.
//  Copyright © 2018 Bois Duval. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var question: UILabel!
    
    
    /*public func changeLabelTitle(title: String)
    {
       // question?.text = title;
       // print(question?.text)
    }*/
    
    var title = "" {
        didSet {
            question.text = title
        }
    }
    
}
