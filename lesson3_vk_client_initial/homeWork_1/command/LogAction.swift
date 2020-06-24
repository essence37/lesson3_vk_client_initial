//
//  LogAction.swift
//  homeWork_1
//
//  Created by Пазин Даниил on 23.06.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

public enum LogAction {
    case sentRequest
    case getResponse
    case result
}

public func Log(_ action: LogAction) {
    let command = LogCommand(action: action)
    LoggerInvoker.shared.addLogCommand(command)
}
