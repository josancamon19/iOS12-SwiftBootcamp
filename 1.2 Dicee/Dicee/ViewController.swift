//
//  ViewController.swift
//  Dicee
//
//  Created by Joan Cabezas on 7/11/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2  : Int = 0
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        rollDices()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollDices()
    }
    
    func rollDices(){
        randomDiceIndex1 = Int.random(in: 1...6)
        randomDiceIndex2 = Int.random(in: 1...6)
        diceImageView1.image = UIImage(named: "dice\(randomDiceIndex1)")
        diceImageView2.image = UIImage(named: "dice\(randomDiceIndex2)")
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDices()
    }
    
    
}

