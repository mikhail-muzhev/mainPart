// swiftlint:disable file_length
//
//  Style.swift
//  LTViewStyle
//
//  Created by Pavel Razuvaev on 08/02/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import Foundation
import UIKit

public struct Style<View: UIView> {
    
    public let style: (View) -> Void
    
    public init(_ style: @escaping (View) -> Void) {
        self.style = style
    }
    
    public func apply(to view: View) {
        style(view)
    }
    
}

enum DefaultStyle {

    static let label = Style<AttributedLabel> {
        $0.textColor = .black
    }
    
    static let button = Style<AttributedButton> {
        $0.normalAttributedTitleLabel?.style = DefaultStyle.label
    }

}

enum ButtonStyle {
    
    case whiteMediumCenter20
    case lightGreenMediumCenter17
    case greenBoldCenter20
    case mainPageSelection
    case next
    case showSymbols
    case skip
    case changePhoneNumber
    case saveChanges
    case menu
    case answer
    case share
    case print
    case whiteRegularCenter17
    case saveToAccount
    case shareInstruction
    case networkReload
    case instructionFullReview
    
    var value: Style<AttributedButton> {
        switch self {
        case .whiteMediumCenter20:
            return Style<AttributedButton> {
                $0.normalAttributedTitleLabel?.style = LabelStyle.whiteMediumCenter20.value
                $0.selectedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.highlitedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.disabledAttributedTitleLabel?.style = LabelStyle.whiteMediumCenter20.value
                $0.layer.cornerRadius = 8
            }
        case .instructionFullReview:
            return Style<AttributedButton> {
                $0.normalAttributedTitleLabel?.style = LabelStyle.whiteMediumCenter20.value
                $0.selectedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.highlitedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.disabledAttributedTitleLabel?.style = LabelStyle.grayMediumCenter20.value
                $0.layer.cornerRadius = 8
            }
        case .lightGreenMediumCenter17:
            return Style<AttributedButton> {
                $0.normalAttributedTitleLabel?.style = LabelStyle.lightGreenMediumCenter17.value
                $0.disabledAttributedTitleLabel?.style = LabelStyle.lightGreenMediumCenter17Disabled.value
                $0.selectedAttributedTitleLabel?.style = LabelStyle.lightGreenMediumCenter17Disabled.value
                $0.highlitedAttributedTitleLabel?.style = LabelStyle.lightGreenMediumCenter17Disabled.value
            }
        case .greenBoldCenter20:
            return Style<AttributedButton> {
                $0.normalAttributedTitleLabel?.style = LabelStyle.greenBoldCenter20.value
                $0.selectedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.highlitedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
            }
        case .next:
            return Style<AttributedButton> {
                $0.normalAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17.value
                $0.selectedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.highlitedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.disabledAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.backgroundColor = .white
                $0.layer.cornerRadius = 10
            }
        case .showSymbols:
            return Style<AttributedButton> {
                $0.setImage(#imageLiteral(resourceName: "hideIcon"), for: .normal)
                $0.setImage(#imageLiteral(resourceName: "showIcon"), for: .selected)
                $0.alpha = 0
            }
        case .skip:
            return Style<AttributedButton> {
                $0.selectedAttributedTitleLabel?.textColor = .gray
            }
        case .changePhoneNumber:
            return Style<AttributedButton> {
                $0.normalAttributedTitleLabel?.style = LabelStyle.whiteMediumCenter20.value
                $0.selectedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.highlitedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.disabledAttributedTitleLabel?.style = LabelStyle.whiteMediumCenter20.value
                $0.layer.cornerRadius = 8
            }
        case .saveChanges:
            return Style<AttributedButton> {
                $0.normalAttributedTitleLabel?.style = LabelStyle.whiteMediumCenter20.value
                $0.selectedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.highlitedAttributedTitleLabel?.style = LabelStyle.greenBoldCenter17Disabled.value
                $0.disabledAttributedTitleLabel?.style = LabelStyle.whiteMediumCenter20.value
                $0.layer.cornerRadius = 8
            }
        case .mainPageSelection:
            return Style<AttributedButton> {
                $0.selectedAttributedTitleLabel?.style = LabelStyle.whiteBoldCenter15.value
                $0.normalAttributedTitleLabel?.style = LabelStyle.blackMediumCenter15.value
                $0.highlitedAttributedTitleLabel?.style = LabelStyle.blackMediumCenter15.value
                $0.disabledAttributedTitleLabel?.style = LabelStyle.blackMediumCenter15.value
                $0.layer.cornerRadius = 5
            }
        case .menu:
            return Style<AttributedButton> {
                $0.setImage(#imageLiteral(resourceName: "menuButtonIcon"), for: .normal)
                $0.layer.cornerRadius = 0.5 * $0.bounds.size.width
            }
        case .share:
            return Style<AttributedButton> {
                $0.setImage(#imageLiteral(resourceName: "shareButtonGreen"), for: .normal)
                $0.layer.cornerRadius = 0.5 * $0.bounds.size.width
            }
        case .print:
            return Style<AttributedButton> {
                $0.setImage(#imageLiteral(resourceName: "printButtonGreen"), for: .normal)
                $0.layer.cornerRadius = 0.5 * $0.bounds.size.width
            }
        case .answer:
            return Style<AttributedButton> {
                $0.normalAttributedTitleLabel?.style = LabelStyle.blackMediumCenter17.value
                $0.selectedAttributedTitleLabel?.style = LabelStyle.whiteBoldCenter17.value
                $0.backgroundColor = .lawyerInPocketMainGray
                $0.layer.cornerRadius = 8
            }
        case .whiteRegularCenter17:
            return Style<AttributedButton> {
                $0.normalAttributedTitleLabel?.style = LabelStyle.whiteRegularCenter17.value
                $0.selectedAttributedTitleLabel?.style = LabelStyle.whiteBoldCenter17.value
            }
        case .saveToAccount:
            return Style<AttributedButton> {
                $0.apply(ButtonStyle.greenBoldCenter20.value)
                $0.backgroundColor = .clear
            }
        case .shareInstruction:
            return Style<AttributedButton> {
                $0.apply(ButtonStyle.greenBoldCenter20.value)
                $0.backgroundColor = .clear
                $0.setImage(#imageLiteral(resourceName: "shareInstruction"), for: .normal)
                $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 6)
                $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 0)
            }
        case .networkReload:
            return Style<AttributedButton> {
                $0.backgroundColor = .clear
                $0.setImage(#imageLiteral(resourceName: "reloadIcon"), for: .normal)
            }
        }
    }

}

// swiftlint:disable type_body_length
enum LabelStyle {

    case alwaysBlackMediumLeft
    case whiteBoldRight17
    case whiteBoldRight24
    case whiteMediumRight20
    case whiteMediumLeft15
    case whiteMediumLeft17
    case whiteRegularCenter17
    case whiteSemiboldCenter14
    case greenMediumLeft14
    case greenBoldCenter17
    case greenMediumLeft17
    case whiteMediumCenter20
    case greenBoldCenter17Disabled
    case blackBoldRight18
    case blackBoldLeft32
    case blackBoldLeft17
    case blackBoldLeft20
    case blackBoldLeft24
    case blackBoldLeft26
    case blackRegularLeft14
    case blackRegularLeft18
    case blackMediumLeft14
    case blackMediumLeft17
    case blackMediumLeft18
    case blackMediumLeft20
    case blackRegularRight15
    case blackMediumCenter14
    case blackMediumCenter15
    case blackMediumCenter20
    case grayBoldLeft12
    case grayMediumRight14
    case grayMediumRight17
    case grayMediumLeft17
    case grayMediumCenter17
    case grayMediumRight18
    case grayRegularLeft14
    case grayRegularLeft20
    case grayRegularRight15
    case greenBoldCenter20
    case greenBoldLeft17
    case greenBoldLeft18
    case greenBoldLeft20
    case greenBoldLeft24
    case redRegularRight14
    case redRegularLeft14
    case lightGreenMediumCenter17
    case lightGreenMediumCenter17Disabled
    
    case whiteMediumCenter14
    
    case whiteRegularRight18
    case whiteBoldCenter15
    case whiteRegularRight16
    case whiteRegularLeft15
    case whiteBoldLeft18
    case whiteBoldLeft24
    case grayBoldLeft17
    case blackMediumCenter17
    case whiteBoldCenter17
    case grayMediumCenter20

    var value: Style<AttributedLabel> {
        switch self {
        case .whiteBoldRight17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 17)
                $0.textColor = .white
                $0.lineHeight = 21
                $0.lineBreakMode = .byWordWrapping
                $0.numberOfLines = 0
            }
        case .whiteBoldRight24:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 24)
                $0.textColor = .white
                $0.lineHeight = 30
                $0.numberOfLines = 0
            }
        case .whiteMediumRight20:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 20)
                $0.textColor = .white
                $0.lineHeight = 26
                $0.numberOfLines = 0
            }
        case .whiteMediumLeft15:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 15)
                $0.textColor = .white
                $0.textAlignment = .left
                $0.numberOfLines = 0
            }
        case .whiteMediumLeft17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 17)
                $0.textColor = .white
                $0.textAlignment = .left
                $0.numberOfLines = 0
            }
        case .whiteSemiboldCenter14:
            return Style<AttributedLabel> {
                $0.font = R.font.sfuiDisplaySemibold(size: 14)
                $0.textColor = .white
                $0.textAlignment = .center
                $0.numberOfLines = 1
                $0.lineHeight = 18
            }
        case .whiteRegularCenter17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 17)
                $0.textColor = .white
                $0.textAlignment = .center
                $0.numberOfLines = 0
            }
        case .greenBoldLeft17:
            return Style<AttributedLabel> {
                $0.font = R.font.sfProDisplayBold(size: 17)
                $0.textColor = .lawyerInPocketEmerald
                $0.textAlignment = .left
            }
        case .greenBoldLeft18:
            return Style<AttributedLabel> {
                $0.font = R.font.sfProDisplayBold(size: 18)
                $0.textColor = .lawyerInPocketEmerald
                $0.lineHeight = 23
                $0.textAlignment = .left
            }
        case .greenBoldCenter17:
            return Style<AttributedLabel> {
                $0.font = R.font.sfProDisplayBold(size: 17)
                $0.textColor = .lawyerInPocketEmerald
            }
        case .greenBoldCenter17Disabled:
            return Style<AttributedLabel> {
                $0.font = R.font.sfProDisplayBold(size: 17)
                $0.textColor = .lightGray
            }
        case .greenMediumLeft14:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 14)
                $0.textColor = .lawyerInPocketKelleyGreen
                $0.textAlignment = .left
            }
        case .greenMediumLeft17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 17)
                $0.lineHeight = 22
                $0.textAlignment = .left
                $0.textColor = .lawyerInPocketEmerald
            }
        case .whiteMediumCenter20:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 20)
                $0.textColor = .white
            }
        case .blackBoldLeft32:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 32)
                $0.lineHeight = 36
                $0.textColor = .lawyerInPocketTitleBlack
                $0.textAlignment = .left
            }
        case .blackMediumLeft14:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 14)
                $0.textAlignment = .left
                $0.textColor = .black
            }
        case .blackMediumLeft17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 17)
                $0.lineHeight = 22
                $0.textAlignment = .left
                $0.textColor = .lawyerInPocketTitleBlack
            }
        case .blackMediumLeft20:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 20)
                $0.lineHeight = 22
                $0.textAlignment = .left
                $0.textColor = .foreground
            }
        case .alwaysBlackMediumLeft:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 20)
                $0.lineHeight = 22
                $0.textAlignment = .left
                $0.textColor = UIColor(0)
            }
        case .blackBoldRight18:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 18)
                $0.textColor = .lawyerInPocketTitleBlack
            }
        case .blackMediumCenter15:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 15)
                $0.textColor = .lawyerInPocketBlack
                $0.textAlignment = .center
                $0.lineHeight = 20
            }
        case .blackMediumCenter20:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 20)
                $0.textColor = .lawyerInPocketBlack
                $0.textAlignment = .center
                $0.lineHeight = 20
            }
        case .blackRegularLeft14:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 14)
                $0.textColor = .lawyerInPocketBlack
                $0.textAlignment = .left
            }
        case .blackRegularLeft18:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.blackRegularLeft14.value)
                $0.font = R.font.ptRootUIRegular(size: 18)
                $0.numberOfLines = 0
            }
        case .blackMediumCenter14:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 14)
                $0.textColor = .lawyerInPocketBlack
                $0.textAlignment = .center
            }
        case .blackMediumLeft18:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 18)
                $0.textColor = .black
                $0.lineHeight = 23
                $0.textAlignment = .left
                $0.lineBreakMode = .byWordWrapping
                $0.numberOfLines = 0
            }
        case .blackBoldLeft24:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.greenBoldLeft24.value)
                $0.lineBreakMode = .byWordWrapping
                $0.textColor = .lawyerInPocketBlack
            }
        case .blackBoldLeft20:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.greenBoldLeft20.value)
                $0.textColor = .lawyerInPocketBlack
            }
        case .blackBoldLeft17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 17)
                $0.lineHeight = 20
                $0.lineBreakMode = .byWordWrapping
                $0.textColor = .lawyerInPocketBlack
            }
        case .blackBoldLeft26:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 26)
                $0.textColor = .lawyerInPocketBlack
                $0.textAlignment = .left
            }
        case .whiteBoldCenter15:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.blackMediumCenter15.value)
                $0.font = R.font.ptRootUIBold(size: 15)
                $0.textColor = .white
            }
        case .whiteMediumCenter14:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.blackMediumCenter14.value)
                $0.font = R.font.ptRootUIMedium(size: 14)
                $0.textColor = .white
            }
        case .grayMediumLeft17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 17)
                $0.textColor = .lawyerInPocketCharcoalGrey50
                $0.textAlignment = .left
                $0.lineHeight = 22
            }
        case .grayBoldLeft12:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 12)
                $0.textColor = .lawyerInPocketBlack50
                $0.textAlignment = .left
            }
        case .grayMediumRight18:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 18)
                $0.lineHeight = 25
                $0.textColor = UIColor.lawyerInPocketTitleBlack.withAlphaComponent(0.5)
            }
        case .grayRegularRight15:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 15)
                $0.textColor = .lawyerInPocketBlack40
            }
        case .grayRegularLeft14:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 14)
                $0.textColor = .lawyerInPocketBlack50
            }
        case .grayRegularLeft20:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 20)
                $0.textColor = .lawyerInPocketBlack30
            }
        case .blackRegularRight15:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 15)
                $0.textColor = .black
            }
        case .greenBoldCenter20:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 20)
                $0.textAlignment = .center
                $0.textColor = .lawyerInPocketEmerald
            }
        case .greenBoldLeft20:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 20)
                $0.textAlignment = .left
                $0.textColor = .lawyerInPocketEmeraldThree
            }
        case .greenBoldLeft24:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.greenBoldLeft20.value)
                $0.font = R.font.ptRootUIBold(size: 24)
            }
        case .redRegularRight14:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 14)
                $0.textColor = .lawyerInPocketCherryRed
                $0.textAlignment = .center
            }
        case .redRegularLeft14:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 14)
                $0.textColor = .lawyerInPocketCherryRed
                $0.numberOfLines = 0
                $0.lineBreakMode = .byWordWrapping
                $0.textAlignment = .left
            }
        case .lightGreenMediumCenter17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 17)
                $0.underlineStyle = NSUnderlineStyle.single.rawValue
                $0.textColor = .lawyerInPocketEmerald
            }
        case .lightGreenMediumCenter17Disabled:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.lightGreenMediumCenter17.value)
                $0.textColor = UIColor.lawyerInPocketEmerald.withAlphaComponent(0.5)
            }
        case .grayMediumRight14:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 14)
                $0.lineHeight = 22
                $0.textColor = UIColor.lawyerInPocketBlack.withAlphaComponent(0.5)
            }
        case .grayMediumRight17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 17)
                $0.lineHeight = 22
                $0.textAlignment = .right
                $0.textColor = UIColor.lawyerInPocketBlack.withAlphaComponent(0.5)
            }
        case .grayMediumCenter17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 17)
                $0.lineHeight = 22
                $0.textAlignment = .center
                $0.textColor = .lawyerInPocketCharcoalGrey50
            }
        case .grayMediumCenter20:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 20)
                $0.textAlignment = .center
                $0.textColor = .lawyerInPocketCharcoalGrey50
            }
        case .whiteRegularRight18:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 18)
                $0.textColor = .white
                $0.lineHeight = 27
                $0.numberOfLines = 0
            }
        case .whiteRegularRight16:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 16)
                $0.textColor = .white
                $0.lineHeight = 17
                $0.numberOfLines = 0
            }
        case .whiteRegularLeft15:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 15)
                $0.textColor = .white
                $0.lineHeight = 19
                $0.textAlignment = .left
            }
        case .whiteBoldLeft18:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 18)
                $0.textColor = .white
                $0.lineHeight = 23
                $0.textAlignment = .left
            }
        case .whiteBoldLeft24:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIBold(size: 24)
                $0.textColor = .white
                $0.lineHeight = 32
                $0.textAlignment = .left
            }
        case .grayBoldLeft17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIRegular(size: 17)
                $0.textColor = UIColor.lawyerInPocketBlack.withAlphaComponent(0.5)
                $0.lineHeight = 22
                $0.textAlignment = .left
            }
        case .blackMediumCenter17:
            return Style<AttributedLabel> {
                $0.font = R.font.ptRootUIMedium(size: 17)
                $0.textColor = .lawyerInPocketBlack
                $0.textAlignment = .center
                $0.lineHeight = 22
            }
        case .whiteBoldCenter17:
            return Style<AttributedLabel> {
                $0.apply(LabelStyle.blackMediumCenter17.value)
                $0.font = R.font.ptRootUIBold(size: 17)
                $0.textColor = .white
            }
        }
    }

    var stringAttributes: [NSAttributedString.Key: Any] {
        let label = AttributedLabel(text: " ", style: self)
        label.apply(self.value)
        guard let attributes = label.attributedText?.attributes(at: 0, effectiveRange: nil) else { return [:] }
        return attributes
    }

}



enum TextFieldStyle {

    static let blackMediumCenter40 = Style<UITextField> {
        $0.font = R.font.ptRootUIMedium(size: 40)
        $0.textColor = .lawyerInPocketBlack
        $0.textAlignment = .center
        $0.keyboardType = .numberPad
        $0.backgroundColor = .lawyerInPocketDisabledText
        $0.borderStyle = .none
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lawyerInPocketDisabledText.cgColor
        $0.clipsToBounds = true
        $0.tintColor = .lawyerInPocketEmerald
    }

    static let phoneNumber = Style<UITextField> {
        $0.backgroundColor = .lawyerInPocketDisabledText
        $0.layer.cornerRadius = 8
        let leftView = UIView()
        leftView.snp.makeConstraints({ (make) in
            make.width.equalTo(16)
            make.height.equalTo(20)
        })
        $0.leftView = leftView
        $0.leftViewMode = .always
    }
    
    static let info = Style<UITextField> {
        let leftView = UIView()
        leftView.snp.makeConstraints({ (make) in
            make.width.equalTo(16)
            make.height.equalTo(20)
        })
        $0.leftView = leftView
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: .zero)
        $0.rightView?.snp.makeConstraints({ (make) in
            make.width.equalTo(34)
            make.height.equalTo(18)
        })
        $0.clearButtonMode = .never
        $0.font = R.font.ptRootUIMedium(size: 20)
        $0.textColor = .lawyerInPocketBlack
        $0.textAlignment = .left
        $0.backgroundColor = .lawyerInPocketDisabledText
        $0.borderStyle = .none
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lawyerInPocketDisabledText.cgColor
        $0.clipsToBounds = true
        $0.tintColor = .lawyerInPocketEmerald
    }
    
    static let password = Style<UITextField> {
        $0.apply(TextFieldStyle.phoneNumber)
        $0.returnKeyType = .done
    }

    static let promocode = Style<UITextField> {
        let leftView = UIView()
        leftView.snp.makeConstraints({ (make) in
            make.width.equalTo(16)
            make.height.equalTo(20)
        })
        $0.leftView = leftView
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: .zero)
        $0.rightView?.snp.makeConstraints({ (make) in
            make.width.equalTo(34)
            make.height.equalTo(18)
        })
        $0.font = R.font.ptRootUIMedium(size: 20)
        $0.textColor = .lawyerInPocketBlack
        $0.textAlignment = .left
        $0.keyboardType = .default
        $0.returnKeyType = .done
        $0.backgroundColor = .lawyerInPocketDisabledText
        $0.borderStyle = .none
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lawyerInPocketDisabledText.cgColor
        $0.clipsToBounds = true
        $0.tintColor = .black
    }

}
// swiftlint:enable type_body_length

enum StackViewStyle {

    static let horizontalWhiteProportional = Style<UIStackView> {
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.backgroundColor = .white
    }

}

struct UIConstants {

    struct MainForeground {
        static let fullHeight: CGFloat = 160
        static let partitialHeight: CGFloat = {
            let bottomBarHeight: CGFloat = 50
            let containerHeight: CGFloat = 70
            var result = Screen.height - bottomBarHeight - containerHeight
            return result
        }()
        static let collapsedHeight: CGFloat = 160
    }

    struct AccountForeground {
        static let cornerRadius: CGFloat = 16
    }

}
