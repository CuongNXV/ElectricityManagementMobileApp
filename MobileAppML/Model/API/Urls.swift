//
//  Urls.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

enum Urls {
    private static let endPoint = "http://sv-procon.uet.vnu.edu.vn:3002"
    static let urlLogin = endPoint + "/api/auth/login"
    static let urlUpload = endPoint + "/api/process-image/img2digit-mobile"
    static let urlSendInfo = endPoint + "/api/metric-box-digit/upload/mobile"
    static let firebaseUpload = "gs://electricitymanagement-d1b6a.appspot.com/imageML"
}
