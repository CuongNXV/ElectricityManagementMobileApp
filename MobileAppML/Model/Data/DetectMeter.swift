//
//  DetectMeter.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/9/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

final class DetectMeter: Mappable {
    var data = ""
    var success = false
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
}
