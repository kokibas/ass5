//
//  TableViewController.swift
//  lecture7
//
//  Created by admin on 31.01.2021.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FirstTableViewCell.nib, forCellReuseIdentifier: FirstTableViewCell.identifider)
        tableView.register(SecondTableViewCell.nib, forCellReuseIdentifier: SecondTableViewCell.identifider)
        // Do any additional setup after loading the view.
    }
}


extension TableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifider, for: indexPath) as! FirstTableViewCell
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifider, for: indexPath) as! SecondTableViewCell
        
        return cell
       
    }
}
