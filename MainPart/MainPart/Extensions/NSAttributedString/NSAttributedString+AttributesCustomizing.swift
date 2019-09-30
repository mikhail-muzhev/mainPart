//
//  NSAttributedString+AttributesCustomizing.swift
//  LawyerInPocket
//
//  Created by Mikhail Muzhev on 24/04/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit

public extension NSAttributedString {
    
    func newAttribute(for key: NSAttributedString.Key, to value: Any) -> NSAttributedString {
        let mutableString = NSMutableAttributedString(attributedString: self)
        let range = NSRange(location: 0, length: mutableString.length)
        mutableString.removeAttribute(key, range: range)
        mutableString.addAttribute(key, value: value, range: range)
        return mutableString
    }
    
    func newAttribute(for key: NSAttributedString.Key, to value: Any, in range: NSRange) -> NSAttributedString {
        let mutableString = NSMutableAttributedString(attributedString: self)
        mutableString.removeAttribute(key, range: range)
        mutableString.addAttribute(key, value: value, range: range)
        return mutableString
    }
    
    func attribute<T>(for key: NSAttributedString.Key) -> T? {
        let attributes = self.attributes(at: 0, effectiveRange: nil)
        let attribute = attributes.first(where: { return $0.key == key })?.value
        guard let value = attribute as? T else { return nil }
        return value
    }

    func string(with newAttributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        var newString = self
        for (key, value) in newAttributes {
            newString = newString.newAttribute(for: key, to: value)
        }
        return newString
    }

}
