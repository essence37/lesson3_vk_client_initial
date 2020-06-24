//
//  LogCommand.swift
//  homeWork_1
//
//  Created by Пазин Даниил on 23.06.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

// MARK: - Command
final class LogCommand {
    
    let action: LogAction
    
    init(action: LogAction) {
        self.action = action
    }
    
    var logMessage: String {
        switch self.action {
        case .sentRequest:
            return "Отправляется запрос на сервер."
        case .getResponse:
            return "Получен ответ."
        case .result:
            return "Ответ обработан."
        }
    }
}

