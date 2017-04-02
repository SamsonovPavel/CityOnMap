//
//  CityCollectionVC
//  CityCollectionVCRouter.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 01/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

class CityCollectionVCRouter: CityCollectionVCRouterInput {
    func presentViewController(vc: UIViewController, longitude: Double?, latitude: Double?) {
        push(vc: vc, GoogleMapsVC.create())
        let google = vc.navigationController?.viewControllers.last as! GoogleMapsVC
        google.longitude = longitude
        google.latitude = latitude
    }
}
