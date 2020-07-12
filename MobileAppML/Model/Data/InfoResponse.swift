//
//  InfoResponse.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

final class InfoResponse: Mappable {
    var token = ""
    var success = false
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        token <- map["result.token"]
    }
}
