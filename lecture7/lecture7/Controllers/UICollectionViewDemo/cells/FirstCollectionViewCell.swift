//
//  FirstCollectionViewCell.swift
//  lecture7
//
//  Created by admin on 31.01.2021.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    static let identifider = String(describing: FirstCollectionViewCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
