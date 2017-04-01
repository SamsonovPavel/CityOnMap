//
//  CityCollectionVC
//  CityCollectionVCViewController.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 01/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

class CityCollectionVCViewController: UIViewController, CityCollectionVCViewInput {

    var output: CityCollectionVCViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: CityCollectionVCViewInput
    func setupInitialState() {
    }
}
