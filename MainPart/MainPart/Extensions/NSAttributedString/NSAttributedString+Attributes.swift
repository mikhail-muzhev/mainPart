//
//  NSAttributedString+Attributes.swift
//  TemplateProject
//
//  Created by Pavel Pronin on 30/04/2017.
//  Copyright © 2017 Live Typing. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    convenience init(string: String?, font: UIFont, color: UIColor, letterSpacing: CGFloat = 0) {
        let attributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.kern: letterSpacing
            ] as [NSAttributedString.Key: Any]
        self.init(string: string ?? "", attributes: attributes)
    }

    convenience init(string: String?, style: LabelStyle) {
        let attributes = style.stringAttributes
        self.init(string: string ?? "", attributes: attributes)
    }
    
    // MARK: - Mutate
    
    func addLetterSpacing(_ value: CGFloat) -> NSAttributedString {
        guard let mutableCopy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        mutableCopy.addAttribute(NSAttributedString.Key.kern,
                                 value: value,
                                 range: NSRange(location: 0, length: length))
        return mutableCopy
    }
    
    // MARK: - NSParagraphStyle
    
    func addParagraphStyle(_ paragraphStyle: NSParagraphStyle) -> NSAttributedString {
        guard let mutableCopy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        mutableCopy.addAttribute(NSAttributedString.Key.paragraphStyle,
                                 value: paragraphStyle,
                                 range: NSRange(location: 0, length: length))
        return mutableCopy
    }
    
    // MARK: - Attributes
    
    func addMinimumLineHeight(_ value: CGFloat) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = value
        return addParagraphStyle(paragraphStyle)
    }
    
    func addMaximumLineHeight(_ value: CGFloat) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = value
        return addParagraphStyle(paragraphStyle)
    }
}
