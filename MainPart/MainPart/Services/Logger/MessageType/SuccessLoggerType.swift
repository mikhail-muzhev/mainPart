//
//  SuccessLoggerType.swift
//  FirstPartApp
//
//  Created by Mikhail Muzhev on 25/09/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import Foundation

struct SuccessLoggerType: LoggerMessageType {

    var prefix: String {
        get {
            return "👍 Success: "
        }
    }

}
