//
//  DarkModeViewController.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 02/10/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit

class DarkModeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .background
        title = R.string.localizable.dark_mode_title()
    }

}
