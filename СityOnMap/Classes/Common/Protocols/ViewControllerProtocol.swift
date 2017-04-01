//
//  ViewControllerProtocol.swift
//  СityOnMap
//
//  Created by Pavel Samsonov on 01.04.17.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol {
    static func create() -> UIViewController
    static func storyBoardName() -> String
}

extension ViewControllerProtocol where Self: UIViewController {
    // MARK:- Create
    static func create() -> UIViewController {
        let storyboard = self.storyboard()
        
        let className = NSStringFromClass(Self.self)
        let finalClassName = className.components(separatedBy: ".").last!
        let viewControllerId = finalClassName + "ID"
        
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerId)
        
        return viewController
    }
    
    static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: storyBoardName(), bundle: nil)
    }
}
