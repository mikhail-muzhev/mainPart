//
//  UIView+Subviews.swift
//  TemplateProject
//
//  Created by Pavel Pronin on 30/04/2017.
//  Copyright © 2017 Live Typing. All rights reserved.
//

import UIKit
import SnapKit


extension UIView {

    func addSubviews(_ subviews: [UIView]) {
        for view in subviews {
            addSubview(view)
        }
    }

    func addSubviews(_ subviews: UIView...) {
        addSubviews(subviews)
    }

    func removeFromSuperviewSafely() {
        guard superview != nil else { return }
        removeFromSuperview()
        snp.removeConstraints()
    }

}
