//
//  InforRoom.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/10/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

final class InforRoom: Mappable {
    var success = false
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
    }
}
