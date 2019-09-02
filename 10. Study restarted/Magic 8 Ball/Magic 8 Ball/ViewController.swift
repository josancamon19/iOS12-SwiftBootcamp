//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Joan Cabezas on 8/26/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageAnswerIdx : Int = 0

    @IBOutlet weak var answerImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        askQuestion()
    }


    @IBAction func askButton(_ sender: Any) {
        askQuestion()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        askQuestion()
    }
    
    private func askQuestion(){
        imageAnswerIdx = Int.random(in: 1 ... 5)
        answerImageView.image = UIImage(named: "ball\(imageAnswerIdx)")
    }
}

