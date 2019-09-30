//
//  NSParagraphStyle+Styles.swift
//  TemplateProject
//
//  Created by Pavel Pronin on 30/04/2017.
//  Copyright © 2017 Live Typing. All rights reserved.
//

import UIKit

extension NSParagraphStyle {
    
    func add(textAlignment: NSTextAlignment? = nil, lineSpacing: CGFloat? = nil, minimumLineHeight: CGFloat? = nil) -> NSParagraphStyle {
        guard let mutableCopy = self.mutableCopy() as? NSMutableParagraphStyle else { return NSParagraphStyle() }
        if let textAlignment = textAlignment {
            mutableCopy.alignment = textAlignment
        }
        if let lineSpacing = lineSpacing {
            mutableCopy.lineSpacing = lineSpacing
        }
        if let minimumLineHeight = minimumLineHeight {
            mutableCopy.minimumLineHeight = minimumLineHeight
        }
        return mutableCopy
    }
    
    func addAligment(_ textAlignment: NSTextAlignment) -> NSParagraphStyle {
        guard let mutableCopy = mutableCopy() as? NSMutableParagraphStyle else { return NSParagraphStyle() }
        mutableCopy.alignment = textAlignment
        return mutableCopy
    }
    
    func addLineSpacing(_ lineSpacing: CGFloat) -> NSParagraphStyle {
        guard let mutableCopy = mutableCopy() as? NSMutableParagraphStyle else { return NSParagraphStyle() }
        mutableCopy.lineSpacing = lineSpacing
        return mutableCopy
    }
    
    func addMinimumLineHeight(_ minimumLineHeight: CGFloat) -> NSParagraphStyle {
        guard let mutableCopy = mutableCopy() as? NSMutableParagraphStyle else { return NSParagraphStyle() }
        mutableCopy.minimumLineHeight = minimumLineHeight
        return mutableCopy
    }
    
    func addMaximumLineHeight(_ maximumLineHeight: CGFloat) -> NSParagraphStyle {
        guard let mutableCopy = mutableCopy() as? NSMutableParagraphStyle else { return NSParagraphStyle() }
        mutableCopy.maximumLineHeight = maximumLineHeight
        return mutableCopy
    }
    
    func addLineBreakMode(_ lineBreakMode: NSLineBreakMode) -> NSParagraphStyle {
        guard let mutableCopy = mutableCopy() as? NSMutableParagraphStyle else { return NSParagraphStyle() }
        mutableCopy.lineBreakMode = lineBreakMode
        return mutableCopy
    }
    
}
