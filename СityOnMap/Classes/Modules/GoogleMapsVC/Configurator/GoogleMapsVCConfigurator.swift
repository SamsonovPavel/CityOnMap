//
//  GoogleMapsVC
//  GoogleMapsVCConfigurator.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 02/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

class GoogleMapsVCModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? GoogleMapsVC {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: GoogleMapsVC) {
        let router = GoogleMapsVCRouter()

        let presenter = GoogleMapsVCPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = GoogleMapsVCInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
