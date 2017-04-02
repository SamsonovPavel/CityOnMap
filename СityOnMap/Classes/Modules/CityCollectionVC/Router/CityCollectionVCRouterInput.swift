//
//  CityCollectionVC
//  CityCollectionVCRouterInput.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 01/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

protocol CityCollectionVCRouterInput {
    func presentViewController(vc: UIViewController, longitude: Double?, latitude: Double?)
}
