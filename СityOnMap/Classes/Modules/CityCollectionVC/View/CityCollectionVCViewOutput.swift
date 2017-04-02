//
//  CityCollectionVC
//  CityCollectionVCViewOutput.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 01/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

protocol CityCollectionVCViewOutput {
    func getData()
    func presentGoogleMapsVC(vc: UIViewController, longitude: Double?, latitude: Double?)
}
