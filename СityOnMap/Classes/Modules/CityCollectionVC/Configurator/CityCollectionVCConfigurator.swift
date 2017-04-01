//
//  CityCollectionVC
//  CityCollectionVCConfigurator.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 01/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

class CityCollectionVCModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? CityCollectionVCViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CityCollectionVCViewController) {

        let router = CityCollectionVCRouter()

        let presenter = CityCollectionVCPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CityCollectionVCInteractor()
        interactor.presenter = presenter

        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
