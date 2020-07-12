//
//  UIViewController+.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(Constant.Alert.alertOK, comment: ""),
                                      style: UIAlertAction.Style.default) { (_) in
                                        alert.dismiss(animated: true, completion: nil)
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func getNumber(textField1: UITextField,
                   textField2: UITextField,
                   textField3: UITextField,
                   textField4: UITextField,
                   textField5: UITextField) -> String {
        let number1 = textField1.text!
        let number2 = textField1.text!
        let number3 = textField1.text!
        let number4 = textField1.text!
        let number5 = textField1.text!
        let number = String(number1 + number2 + number3 + number4 + number5)
        return number
    }
    
    func numberMeter(number: String,
                     textField1: UITextField,
                     textField2: UITextField,
                     textField3: UITextField,
                     textField4: UITextField,
                     textField5: UITextField) {
        //print("DETECTED")
        DispatchQueue.main.async {
            if number.count == 0 {
                textField1.text = "0"
                textField2.text = "0"
                textField3.text = "0"
                textField4.text = "0"
                textField5.text = "0"
            } else if number.count == 1 {
                textField1.text = "0"
                textField2.text = "0"
                textField3.text = "0"
                textField4.text = "0"
                let index = number.index(number.startIndex, offsetBy: 0)
                textField5.text = String(number[index])
            } else if number.count == 2 {
                textField1.text = "0"
                textField2.text = "0"
                textField3.text = "0"
                let index1 = number.index(number.startIndex, offsetBy: 0)
                textField4.text = String(number[index1])
                let index2 = number.index(number.startIndex, offsetBy: 1)
                textField5.text = String(number[index2])
            } else if number.count == 3 {
                textField1.text = "0"
                textField2.text = "0"
                let index1 = number.index(number.startIndex, offsetBy: 0)
                textField3.text = String(number[index1])
                let index2 = number.index(number.startIndex, offsetBy: 1)
                textField4.text = String(number[index2])
                let index3 = number.index(number.startIndex, offsetBy: 2)
                textField5.text = String(number[index3])
            } else if number.count == 4 {
                textField1.text = "0"
                let index1 = number.index(number.startIndex, offsetBy: 0)
                textField2.text = String(number[index1])
                let index2 = number.index(number.startIndex, offsetBy: 1)
                textField3.text = String(number[index2])
                let index3 = number.index(number.startIndex, offsetBy: 2)
                textField4.text = String(number[index3])
                let index4 = number.index(number.startIndex, offsetBy: 3)
                textField5.text = String(number[index4])
            } else if number.count == 5 {
                let index1 = number.index(number.startIndex, offsetBy: 0)
                textField1.text = String(number[index1])
                let index2 = number.index(number.startIndex, offsetBy: 1)
                textField2.text = String(number[index2])
                let index3 = number.index(number.startIndex, offsetBy: 2)
                textField3.text = String(number[index3])
                let index4 = number.index(number.startIndex, offsetBy: 3)
                textField4.text = String(number[index4])
                let index5 = number.index(number.startIndex, offsetBy: 4)
                textField5.text = String(number[index5])
            }
        }
        
    }
}
