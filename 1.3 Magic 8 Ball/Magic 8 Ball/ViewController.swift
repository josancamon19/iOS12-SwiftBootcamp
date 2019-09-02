//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Joan Cabezas on 7/11/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        answerQuestion()
        
    }


    @IBAction func askButtonPressed(_ sender: Any) {
        answerQuestion()
    }
    
    func answerQuestion(){
        image.image = UIImage(named: "ball\(Int.random(in: 1...5))")
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        answerQuestion()
    }
}

