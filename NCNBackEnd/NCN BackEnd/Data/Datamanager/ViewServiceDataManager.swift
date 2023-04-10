//
//  ViewServiceDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 23/03/23.
//

import Foundation
public class ViewServiceDataManager {
    public var database: ViewServiceDatabaseContract

    public init(database: ViewServiceDatabaseContract) {
        self.database = database
    }

    private func success(message: [AvailableService], callback: ([AvailableService]) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "No Data" {
            let error = "Service already exist"
            callback(error)
        }
    }
}

extension ViewServiceDataManager: ViewServiceDatacontract {
    public func viewService(success: @escaping ([AvailableService]) -> Void, failure: @escaping (String) -> Void) {
        database.viewService(success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
