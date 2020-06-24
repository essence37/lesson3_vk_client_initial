//
//  LoggerInvoker.swift
//  homeWork_1
//
//  Created by Пазин Даниил on 23.06.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

// MARK: - Invoker

internal final class LoggerInvoker {
    
    // MARK: Singleton
    
    internal static let shared = LoggerInvoker()
    
    // MARK: Private properties
    
    private let logger = Logger()
    
    private var command: LogCommand?
    
    // MARK: Internal
    
    internal func addLogCommand(_ command: LogCommand) {
        self.command = command
        self.executeCommand()
    }
    
    // MARK: Private
    
    private func executeCommand() {
        guard let command = self.command else { return }
        self.logger.writeMessageToLog(command.logMessage)
    }
}

