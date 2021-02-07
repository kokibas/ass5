//
//  SecondTableViewCell.swift
//  lecture7
//
//  Created by admin on 01.02.2021.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    static let identifider = String(describing: SecondTableViewCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
