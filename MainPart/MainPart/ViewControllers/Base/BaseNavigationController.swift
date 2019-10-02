//
//  BaseNavigationController.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 02/10/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    private var navigationBarAppearance: UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        let backIcon = #imageLiteral(resourceName: "backIcon").withRenderingMode(.alwaysOriginal)
        appearance.setBackIndicatorImage(backIcon, transitionMaskImage: backIcon)
        appearance.titleTextAttributes = LabelStyle.blackMediumCenter20.stringAttributes
        appearance.backgroundColor = .white
        appearance.shadowColor = .none
        appearance.shadowImage = nil
        return appearance
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.standardAppearance = navigationBarAppearance
    }

}
