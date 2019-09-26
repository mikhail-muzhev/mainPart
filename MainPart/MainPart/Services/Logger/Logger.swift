//
//  Logger.swift
//  FirstPartApp
//
//  Created by Mikhail Muzhev on 25/09/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import Foundation

struct Logger {

    static func log(type: LoggerType = .default, message: String) {
        print(type.value.prefix + message)
    }

}
