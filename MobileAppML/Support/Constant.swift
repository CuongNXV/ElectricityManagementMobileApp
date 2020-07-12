//
//  Constant.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

enum Constant {
    static var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoicm9vdCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNTk0MzU2MDM2LCJleHAiOjE1OTQ0NDI0MzZ9.ibd96CdcAevQJTaFWjSdYPQH635P4Fe6b3-o_dksnog"
    static var linkImage = ""
    
    enum Alert {
        static let alertOK = "Đồng ý"
        static let alertTitle = "Thông Báo"
        static let alertLoginFail = "Bạn đã nhập sai Username hoặc Password"
        static let internetError = "Vui lòng kiểm tra lại kết nối"
        static let alertWarning = "Vui lòng điền đầy thủ thông tin đăng nhập"
        static let alertUploadFail = "Đã có lỗi sảy ra"
        static let alertSendFail = "Vui lòng điền đầy đủ thông tin số phòng và số điện"
    }
    
    static let cameraId = "UseLibrary"
    static let aboutId = "About"
    
    enum TitleTabBar {
        static let cameraTitle = "Camera"
        static let aboutTitle = "About"
    }
}
