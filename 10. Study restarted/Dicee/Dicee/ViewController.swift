//
//  ViewController.swift
//  Dicee
//
//  Created by Joan Cabezas on 8/26/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollDices()
    }

 
    @IBAction func rollButton(_ sender: UIButton) {
        rollDices()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDices()
    }
    
    private func rollDices(){
        
        randomDiceIndex1 = Int.random(in: 1 ... 6)
        randomDiceIndex2 = Int.random(in: 1 ... 6)
        
        diceImageView1.image = UIImage(named: "dice" + String(randomDiceIndex1))
        diceImageView2.image = UIImage(named: "dice" + String(randomDiceIndex2))
    }
}

