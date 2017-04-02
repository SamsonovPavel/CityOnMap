//
//  CityCollectionCell.swift
//  СityOnMap
//
//  Created by Pavel Samsonov on 01.04.17.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

class CityCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.layer.borderColor   = UIColor.darkGray.cgColor
        self.imageView.layer.borderWidth   = 1.0
        self.imageView.layer.cornerRadius  = self.imageView.bounds.width / 2.0
        self.imageView.layer.masksToBounds = true
    }
}

