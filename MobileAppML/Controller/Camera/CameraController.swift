//
//  CameraController.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

class CameraController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        let camera = UseCamera.instantiate()
        self.navigationController?.pushViewController(camera, animated: true)
    }
    
    @IBAction func chooseFromLib(_ sender: Any) {
        let library = UseLibrary.instantiate()
        self.navigationController?.pushViewController(library, animated: true)
    }
}
