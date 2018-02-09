//
//  ViewController.swift
//  LeJustePrix
//
//  Created by Anthony Bois on 30/01/2018.
//  Copyright © 2018 Bois Duval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnJouer: UIButton!
    @IBOutlet weak var mode: UIButton!
    @IBOutlet weak var parameter: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnJouer.layer.cornerRadius = 13
        mode.layer.cornerRadius = 13
        parameter.layer.cornerRadius = 13
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     
}


