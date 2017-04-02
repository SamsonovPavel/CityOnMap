//
//  City.swift
//  СityOnMap
//
//  Created by Pavel Samsonov on 01.04.17.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import Foundation
import ObjectMapper

struct City : Mappable {
    var city_id:                           Int?
    var city_name:                         String?
    var city_api_url:                      String?
    var city_domain:                       String?
    var city_mobile_server:                String?
    var city_doc_url:                      String?
    var city_latitude:                     Double?
    var city_longitude:                    Double?
    var city_spn_latitude:                 Float?
    var city_spn_longitude:                Float?
    var last_app_android_version:          Int?
    var android_driver_apk_link:           String?
    var transfers:                         Bool?
    var client_email_required:             Bool?
    var registration_promocode:            Bool?
    var experimental_econom_plus:          Int?
    var experimental_econom_plus_time:     Int?
    var experimental_econom_plus_fix_rate: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        city_id                           <- map["city_id"]
        city_name                         <- map["city_name"]
        city_api_url                      <- map["city_api_url"]
        city_domain                       <- map["city_domain"]
        city_mobile_server                <- map["city_mobile_server"]
        city_doc_url                      <- map["city_doc_url"]
        city_latitude                     <- map["city_latitude"]
        city_longitude                    <- map["city_longitude"]
        city_spn_latitude                 <- map["city_spn_latitude"]
        city_spn_longitude                <- map["city_spn_longitude"]
        last_app_android_version          <- map["last_app_android_version"]
        android_driver_apk_link           <- map["android_driver_apk_link"]
        transfers                         <- map["transfers"]
        client_email_required             <- map["client_email_required"]
        registration_promocode            <- map["registration_promocode"]
        experimental_econom_plus          <- map["experimental_econom_plus"]
        experimental_econom_plus_time     <- map["experimental_econom_plus_time"]
        experimental_econom_plus_fix_rate <- map["experimental_econom_plus_fix_rate"]
    }
}
