//
//  Helper.swift
//  СityOnMap
//
//  Created by Pavel Samsonov on 02.04.17.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

func imageFromId(id: Int) -> UIImage {
    let image: UIImage!
    var imageName = ""
    
    switch id {
    case 1:   imageName = "moscow.jpg"
    case 2:   imageName = "s-peterburg.jpg"
    case 3:   imageName = "voronesh.jpg"
    case 4:   imageName = "rostov.jpg"
    case 5:   imageName = "ufa.jpg"
    case 9:   imageName = "shahty.jpg"
    case 107: imageName = "nachabino.jpg"
    default: break
    }
    image = UIImage.init(named: imageName)
    
    return image
}
