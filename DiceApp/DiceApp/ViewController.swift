//
//  ViewController.swift
//  DiceApp
//
//  Created by Admin on 18.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var Label: UILabel!
    
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    
    @IBAction func Button(_ sender: UIButton) {
        let firstNumber = arc4random_uniform(5)+1
        let secendNumber = arc4random_uniform(5)+1
        Label.text = "The sum is: \(firstNumber + secendNumber)"
        
        leftImageView.image = UIImage (named: "dice\(firstNumber)")
        rightImageView.image = UIImage (named: "dice\(secendNumber)")
    }
    
    
    
    
    
    
    
    
    
    
    
    

}

