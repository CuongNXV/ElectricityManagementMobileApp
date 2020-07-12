//
//  TabbarController.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable
import Alamofire

class TabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        setupTabbar()
    }
    
    func setupTabbar() {
        let camera = Storyboards.camera
        let about = Storyboards.about
        
        let cameraController = camera.instantiateViewController(withIdentifier: Constant.cameraId)
        let aboutController = about.instantiateViewController(withIdentifier: Constant.aboutId)
        
        let accountIcon = UIImage(named: "camera")
        let aboutIcon = UIImage(named: "aboutIcon")
        cameraController.tabBarItem = UITabBarItem(title: NSLocalizedString(Constant.TitleTabBar.cameraTitle, comment: ""),
                                                      image: accountIcon, tag: 0)
        aboutController.tabBarItem = UITabBarItem(title: NSLocalizedString(Constant.TitleTabBar.aboutTitle, comment: ""),
                                                  image: aboutIcon, tag: 1)
        
        self.viewControllers = [cameraController, aboutController]
    }
}

extension TabbarController: StoryboardSceneBased {
    static let sceneStoryboard = Storyboards.tabBar
}
