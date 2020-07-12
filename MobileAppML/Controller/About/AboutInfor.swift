//
//  AboutInfor.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

class AboutInfor: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension AboutInfor: StoryboardSceneBased {
    static let sceneStoryboard = Storyboards.about
}
