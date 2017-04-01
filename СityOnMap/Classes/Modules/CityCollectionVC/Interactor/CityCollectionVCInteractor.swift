//
//  CityCollectionVC
//  CityCollectionVCInteractor.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 01/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

class CityCollectionVCInteractor {
    weak var presenter: CityCollectionVCInteractorOutput!
    var data: [City]?
}

extension CityCollectionVCInteractor: CityCollectionVCInteractorInput {
    func getRequest() {
        RequestManager.shared.getCity(completionHandler: { [weak self] cities in
            guard let sself = self else { return }
            if let city = cities?.cities {
                sself.data = city
                sself.presenter.dataArray(cities: sself.data)
            }
        }) { (error) in
            
        }
    }
}

