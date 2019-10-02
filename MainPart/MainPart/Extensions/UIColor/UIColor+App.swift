//
//  UIColor+App.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 27/09/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit

extension UIColor {

    class var background: UIColor? {
        return UIColor(named: "background")
    }
    
    /// 0, 118, 255
    class var brightBlue: UIColor {
        return UIColor(0, 118, 255)
    }
    
    /// 0, 118, 255, 0.5
    class var brightBlue05: UIColor {
        return UIColor.brightBlue.withAlphaComponent(0.5)
    }
    
    // MARK: - Mono Colors
    
    /// 0, 0.5
    class var black05: UIColor {
        return UIColor(0, 0.5)
    }
    
    class var lawyerInPocketBlack30: UIColor {
        return UIColor(58, 0.3)
    }

    class var lawyerInPocketBlack40: UIColor {
        return UIColor(0, 0.4)
    }

    class var lawyerInPocketBlack50: UIColor {
        return UIColor(58, 0.5)
    }
    
    /// 138
    class var steel: UIColor {
        return UIColor(138)
    }
    
    /// 255, 0.5
    class var white05: UIColor {
        return UIColor(255, 0.5)
    }

    class var lawyerInPocketTangerine: UIColor {
        return UIColor(255, 141, 0)
    }

    class var layerInPocketWatermelon: UIColor {
        return UIColor(255, 60, 107)
    }

    class var lawyerInPocketEmerald: UIColor {
        return UIColor(0, 166, 95)
    }

    class var lawyerInPocketEmeraldTwo: UIColor {
        return UIColor(0, 160, 101)
    }

    class var lawyerInPocketEmeraldThree: UIColor {
        return UIColor(0, 164, 98)
    }

    class var lawyerInPocketEmeraldFour: UIColor {
        return UIColor(0, 163, 98)
    }
    
    class var lawyerInPocketTurquoiseGreen: UIColor {
        return UIColor(0, 232, 147)
    }

    class var lawyerInPocketElectricBlue: UIColor {
        return UIColor(0, 81, 255)
    }

    class var lawyerInPocketPurpleishBlue: UIColor {
        return UIColor(72, 72, 255)
    }

    class var lawyerInPocketVioletBlue: UIColor {
        return UIColor(91, 15, 190)
    }

    class var lawyerInPocketTitleBlack: UIColor {
        return UIColor(58, 58, 58)
    }

    class var lawyerInPocketShamrockGreen: UIColor {
        return UIColor(0, 206, 57)
    }

    class var lawyerInPocketCherryRed: UIColor {
        return UIColor(255, 0, 31)
    }

    class var lawyerInPocketDisabledText: UIColor {
        return UIColor(245, 245, 245)
    }

    class var lawyerInPocketBlack: UIColor {
        return UIColor(58, 58, 58)
    }

    class var lawyerInPocketMainGray: UIColor {
        return UIColor(243, 242, 242)
    }

    class var lawyerInPocketKelleyGreen: UIColor {
        return UIColor(0, 154, 52)
    }

    class var lawyerInPocketCharcoalGrey50: UIColor {
        return UIColor(68, 69, 84).withAlphaComponent(0.5)
    }
    
    class var lawyerInPocketLightGray: UIColor {
        return UIColor(236, 236, 236)
    }
    
    class var lawyerInPocketBackgroundGray: UIColor {
        return UIColor(250, 250, 250)
    }
    
    class var lawyerInPocketBackgroundRed: UIColor {
        return UIColor(255, 45, 85)
    }
    
    class var lawyerInPocketBackgroundGreen: UIColor {
        return UIColor(76, 217, 100)
    }

    class var lawyerInPocketSeparatorColor: UIColor {
        return UIColor.black.withAlphaComponent(0.1)
    }
}
