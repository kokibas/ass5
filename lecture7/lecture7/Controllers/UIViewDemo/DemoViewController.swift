//
//  DemoViewController.swift
//  lecture7
//
//  Created by admin on 01.02.2021.
//

import UIKit

class DemoViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x: 100, y: 50, width: 100, height: 100)
        let button = UIButton(frame: rect)
        button.backgroundColor = .green
        self.view.addSubview(button)
        // Do any additional setup after loading the view.
    }
    
}
