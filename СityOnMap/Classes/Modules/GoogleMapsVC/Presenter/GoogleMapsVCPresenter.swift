//
//  GoogleMapsVC
//  GoogleMapsVCPresenter.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 02/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

class GoogleMapsVCPresenter: GoogleMapsVCModuleInput, GoogleMapsVCViewOutput, GoogleMapsVCInteractorOutput {

    weak var view: GoogleMapsVCViewInput!
    var interactor: GoogleMapsVCInteractorInput!
    var router: GoogleMapsVCRouterInput!

    func viewIsReady() {

    }
}
