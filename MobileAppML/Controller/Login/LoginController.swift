//
//  ViewController.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import UIKit
import Alamofire
import Then
import Reusable
import SVProgressHUD

class LoginController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func buttonLogin(_ sender: Any) {
        showLoading()
        requestLogin()
    }
    
    private var isLogin = false
    private var isConnect = false
    private var dataAccount: InfoResponse?
    private let indicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func inputEmpty() -> Bool {
        if (username.text == "" || password.text == "") {
            self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
            message: NSLocalizedString(Constant.Alert.alertWarning, comment: ""))
            return false
        } else {
            return true
        }
    }
    
    func requestLogin() {
        if (inputEmpty()) {
            let param: Parameters = [
                "username": username.text ?? "",
                "password": password.text ?? ""
            ]
            let indicator = UIActivityIndicatorView(style: .medium)
            indicator.startAnimating()
            AccountRequest.shared.login(param) { [unowned self] in
                self.isLogin = $0
                self.isConnect = $1
                self.dataAccount = $2
                guard let data = self.dataAccount else { return }
                let token = data.token
                Constant.token = token
                if self.isConnect {
                    indicator.stopAnimating()
                    print(self.isLogin)
                    if self.isLogin {
                        self.disappearLoading()
                        let tabBar = UIStoryboard(name: "Tabbar", bundle: nil)
                        let tabBarController = tabBar.instantiateViewController(identifier: "TabbarController") as! TabbarController
                        self.navigationController?.pushViewController(tabBarController, animated: true)
                    } else {
                        self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                         message: NSLocalizedString(Constant.Alert.alertLoginFail, comment: ""))
                    }
                } else {
                    self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                     message: NSLocalizedString(Constant.Alert.internetError, comment: ""))
                }
            }
        }
    }

    func showLoading() {
        indicator.center = self.view.center
        indicator.hidesWhenStopped = true
        indicator.color = UIColor.white
        indicator.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        indicator.frame = view.frame
        view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func disappearLoading() {
        indicator.stopAnimating()
    }
}

