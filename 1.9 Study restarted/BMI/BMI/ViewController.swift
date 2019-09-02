//
//  ViewController.swift
//  BMI
//
//  Created by Joan Cabezas on 8/26/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var bmiResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCalculateBMI(_ sender: Any) {
        let weight = Int(tfWeight.text!)
        let height = Int(tfHeight.text!)
        
        if weight != nil && height != nil {
            let bmi = Int(weight!) / (height! * height!)
            bmiResult.text = "\(bmi)"
        }
      
        
    }
}

