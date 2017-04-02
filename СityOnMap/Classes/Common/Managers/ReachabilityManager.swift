//
//  ReachabilityManager.swift
//  СityOnMap
//
//  Created by Pavel Samsonov on 02.04.17.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import Foundation
import Alamofire

enum ReachabilityManagerError: Error {
    case notReachable
}

class ReachabilityManager {
    let networkManager = NetworkReachabilityManager()!
    
    static var shared: ReachabilityManager = {
        return ReachabilityManager()
    }()
    
    //MARK:-
    //MARK: listening
    func startNetworkListening() {
        networkManager.listener = { status in
            switch status {
            case .reachable   : NotificationCenter.default.post(Notification(name: listenerNetworkReachableNotification))
            case .notReachable: NotificationCenter.default.post(Notification(name: listenerNetworkNotReachableNotification))
            default: break
            }
        }
        self.networkManager.startListening()
    }
    func stopNetworkListening() {
        networkManager.stopListening()
    }
}
