//
//  Screen.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 30/09/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit

struct Screen {
    
    /// Screen width: returns UIScreen.main.bounds.width
    static var width: CGFloat { return UIScreen.main.bounds.width }
    
    /// Screen height: returns UIScreen.main.bounds.height
    static var height: CGFloat { return UIScreen.main.bounds.height }
    
    /// Screen bounds: returns UIScreen.main.bounds
    static var bounds: CGRect { return UIScreen.main.bounds }
    
    /// Hardcoded default tab bar height; always 49 since iOS7
    static var tabBarHeight: CGFloat { return 49 }
    
    /// Hardcoded default navigation bar height; always 44 since iOS7
    static var navigationBarHeight: CGFloat { return 44 }
    
    static var scale: CGFloat { return UIScreen.main.scale }
    
    static var widthScale: CGFloat {
        if App.isPhone {
            return self.width / 375
        }
        return self.width / 768
    }
    
    static var heightScale: CGFloat {
        if App.isPhone {
            return self.height / 667
        }
        return self.height / 1024
    }
    
    static var separatorHeight: CGFloat { return 1 / self.scale }

    static var lessThanOrEqualTo4Inches: Bool {
        return Screen.height <= 568
    }

    static var lessThanOrEqualToIPhone6: Bool {
        return Screen.height <= 667
    }
}

struct App {
    
    /// App's name (if applicable).
    public static var appDisplayName: String? {
        // http://stackoverflow.com/questions/28254377/get-app-name-in-swift
        return Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
    }
    
    /// App's bundle ID (if applicable).
    public static var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }
    
    /// Application icon badge current number.
    public static var applicationIconBadgeNumber: Int {
        get {
            return UIApplication.shared.applicationIconBadgeNumber
        }
        set {
            UIApplication.shared.applicationIconBadgeNumber = newValue
        }
    }
    
    /// App's current version (if applicable).
    public static var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// Shared instance of current device.
    public static var currentDevice: UIDevice {
        return UIDevice.current
    }
    
    /// Current device model.
    public static var deviceModel: String {
        return currentDevice.model
    }
    
    /// Current device name.
    public static var deviceName: String {
        return currentDevice.name
    }
    
    /// Current orientation of device.
    public static var deviceOrientation: UIDeviceOrientation {
        return currentDevice.orientation
    }
    
    /// Check if device is iPad.
    public static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    /// Check if device is iPhone.
    public static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    /// Shared instance UIApplication.
    public static var sharedApplication: UIApplication {
        return UIApplication.shared
    }
    
    /// Check if device is registered for remote notifications for current app (read-only).
    public static var isRegisteredForRemoteNotifications: Bool {
        return UIApplication.shared.isRegisteredForRemoteNotifications
    }
    
    /// System current version (read-only).
    public static var systemVersion: String {
        return currentDevice.systemVersion
    }
    
    /// SwifterSwift: Delay function or closure call.
    ///
    /// - Parameters:
    ///   - milliseconds: execute closure after the given delay.
    ///   - queue: a queue that completion closure should be executed on (default is DispatchQueue.main).
    ///   - completion: closure to be executed after delay.
    ///   - Returns: DispatchWorkItem task. You can call .cancel() on it to cancel delayed execution.
    @discardableResult public static func delay(milliseconds: Double, queue: DispatchQueue = .main, completion: @escaping () -> Void) -> DispatchWorkItem {
        let task = DispatchWorkItem { completion() }
        queue.asyncAfter(deadline: .now() + (milliseconds/1000), execute: task)
        return task
    }
    
    /// SwifterSwift: Debounce function or closure call.
    ///
    /// - Parameters:
    ///   - millisecondsOffset: allow execution of method if it was not called since millisecondsOffset.
    ///   - queue: a queue that action closure should be executed on (default is DispatchQueue.main).
    ///   - action: closure to be executed in a debounced way.
    public static func debounce(millisecondsDelay: Int, queue: DispatchQueue = .main, action: @escaping (() -> Void)) -> () -> Void {
        //http://stackoverflow.com/questions/27116684/how-can-i-debounce-a-method-call
        var lastFireTime = DispatchTime.now()
        let dispatchDelay = DispatchTimeInterval.milliseconds(millisecondsDelay)
        
        return {
            let dispatchTime: DispatchTime = lastFireTime + dispatchDelay
            queue.asyncAfter(deadline: dispatchTime) {
                let when: DispatchTime = lastFireTime + dispatchDelay
                let now = DispatchTime.now()
                if now.rawValue >= when.rawValue {
                    lastFireTime = DispatchTime.now()
                    action()
                }
            }
        }
    }
}
