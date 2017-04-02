//
//  CityCollectionVC
//  CityCollectionVCPresenter.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 01/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

class CityCollectionVCPresenter: CityCollectionVCModuleInput {
    weak var view: CityCollectionVCViewInput!
    var interactor: CityCollectionVCInteractorInput!
    var router: CityCollectionVCRouterInput!
}

extension CityCollectionVCPresenter: CityCollectionVCViewOutput {
    func getData() {
        interactor.getRequest()
    }
}

extension CityCollectionVCPresenter: CityCollectionVCInteractorOutput {
    func dataArray(cities: [City]?) {
        view.reloadCollectionVC(cities: cities)
    }
    
    func presentGoogleMapsVC(vc: UIViewController, longitude: Double?, latitude: Double?) {
        router.presentViewController(vc: vc, longitude: longitude, latitude: latitude)
    }
}


















