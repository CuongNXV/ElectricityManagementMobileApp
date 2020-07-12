//
//  AboutController.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

class AboutController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }
    
    @IBAction func buttonAbout(_ sender: Any) {
        let about = AboutInfor.instantiate()
        self.navigationController?.pushViewController(about, animated: true)
    }
    
    @IBAction func buttonLogout(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
