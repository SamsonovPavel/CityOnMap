//
//  CityCollectionVC
//  CityCollectionVCInitializer.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 01/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

class CityCollectionVCModuleInitializer: NSObject {
    //Connect with object on storyboard
    @IBOutlet weak var citycollectionvcViewController: CityCollectionVCViewController!

    override func awakeFromNib() {

        let configurator = CityCollectionVCModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: citycollectionvcViewController)
    }
}
