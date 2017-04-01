//
//  RequestManager.swift
//  СityOnMap
//
//  Created by Pavel Samsonov on 01.04.17.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class RequestManager {
    let baseURL = "http://beta.taxistock.ru/taxik/api/client/query_cities"
    
    fileprivate var requestManager: SessionManager!
    
    static let shared: RequestManager = {
        return RequestManager()
    }()
    
    fileprivate func setup() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        config.timeoutIntervalForResource = 10
        self.requestManager = SessionManager(configuration: config)
    }
    
    public init() {
        setup()
    }
}

extension RequestManager {
    public func getCity(completionHandler:@escaping (_ city: Cities?) -> Void, failure:@escaping (_ error : Error?) -> Void) {
        requestManager.request(baseURL).responseObject { (response: DataResponse<Cities>?) in
            if let cities = response?.result.value {
                completionHandler(cities)
            } else {
                failure(response?.result.error)
            }
        }
    }
}










