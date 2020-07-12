//
//  CustomButtonLogin.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import UIKit

@IBDesignable class CustomButtonLogin: UIButton {
    
    @IBInspectable var radius: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
