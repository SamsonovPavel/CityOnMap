//
//  CityCollectionVC
//  CityCollectionVCPresenter.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 01/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

class CityCollectionVCPresenter: CityCollectionVCModuleInput,
                                 CityCollectionVCViewOutput,
                                 CityCollectionVCInteractorOutput {
    weak var view: CityCollectionVCViewInput!
    var interactor: CityCollectionVCInteractorInput!
    var router: CityCollectionVCRouterInput!

    func viewIsReady() {

    }
}
