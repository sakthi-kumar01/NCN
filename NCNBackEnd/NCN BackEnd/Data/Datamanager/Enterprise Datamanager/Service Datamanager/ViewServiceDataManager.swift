//
//  ViewServiceDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 23/03/23.
//

import Foundation
public class ViewServiceDataManager {
    public var database: ViewServiceDatabaseServiceContract

    public init(database: ViewServiceDatabaseServiceContract) {
        self.database = database
    }

    private func success(response: [AvailableService], callback: ([AvailableService]) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No Data" {
            let error = "Service already exist"
            callback(error)
        }
    }
}

extension ViewServiceDataManager: ViewServiceDatacontract {
    public func viewService(success: @escaping ([AvailableService]) -> Void, failure: @escaping (String) -> Void) {
        database.viewService(success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
