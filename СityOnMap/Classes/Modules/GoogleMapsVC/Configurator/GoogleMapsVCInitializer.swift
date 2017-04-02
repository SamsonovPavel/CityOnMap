//
//  GoogleMapsVC
//  GoogleMapsVCInitializer.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 02/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

class GoogleMapsVCModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var googlemapsvcViewController: GoogleMapsVC!

    override func awakeFromNib() {
        let configurator = GoogleMapsVCModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: googlemapsvcViewController)
    }

}
