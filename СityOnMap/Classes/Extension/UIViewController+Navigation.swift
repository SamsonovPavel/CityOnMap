//
//  UIViewController+Navigation.swift
//  СityOnMap
//
//  Created by Pavel Samsonov on 02.04.17.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

extension CityCollectionVCRouterInput {
    func push(vc: UIViewController, _ viewController: UIViewController, animated: Bool = true) {
        vc.navigationController?.pushViewController(viewController, animated: animated)
    }
}
