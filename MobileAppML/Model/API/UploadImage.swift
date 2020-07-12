//
//  UploadImage.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/9/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class UploadImage {

    static let shared = UploadImage()
    let reachabilityManager = NetworkReachabilityManager()
    private init() {
    }
    
    func upload(_ param: Parameters,
               _ token: String,
               completion callback: @escaping (Bool, Bool, DetectMeter) -> Void) {
        Alamofire.request(Urls.urlUpload,
                          method: .post,
                          parameters: param,
                          encoding: JSONEncoding.default,
                          headers: ["x-access-token":token])
            .responseObject { (response: DataResponse<DetectMeter>) in
                self.reachabilityManager?.startListening()
                self.reachabilityManager?.listener = { _ in
                    var statusInternet = false
                    guard let dataResponse = response.result.value else { return }
                    if let isNetworkReachable = self.reachabilityManager?.isReachable,
                        isNetworkReachable == true {
                        statusInternet = true
                        let detectResponse = response.result.value
                        if let success = detectResponse?.success {
                            callback(success, statusInternet, dataResponse)
                        }
                    } else {
                        callback(false, statusInternet, dataResponse)
                    }
                }
        }
    }
    
    func send(_ param: Parameters,
               _ token: String,
               completion callback: @escaping (Bool, Bool) -> Void) {
        Alamofire.request(Urls.urlSendInfo,
                          method: .post,
                          parameters: param,
                          encoding: JSONEncoding.default,
                          headers: ["x-access-token":token])
            .responseObject { (response: DataResponse<InforRoom>) in
                self.reachabilityManager?.startListening()
                self.reachabilityManager?.listener = { _ in
                    var statusInternet = false
                    if let isNetworkReachable = self.reachabilityManager?.isReachable,
                        isNetworkReachable == true {
                        statusInternet = true
                        let detectResponse = response.result.value
                        if let success = detectResponse?.success {
                            callback(success, statusInternet)
                        }
                    } else {
                        callback(false, statusInternet)
                    }
                }
        }
    }
    
}
