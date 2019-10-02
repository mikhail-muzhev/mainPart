//
//  BaseViewController.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 26/09/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}
