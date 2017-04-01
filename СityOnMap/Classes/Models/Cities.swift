//
//  Pay.swift
//  СityOnMap
//
//  Created by Pavel Samsonov on 01.04.17.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import Foundation
import ObjectMapper

struct Cities: Mappable {
    var cities: [City]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        cities <- map["cities"]
    }
}
