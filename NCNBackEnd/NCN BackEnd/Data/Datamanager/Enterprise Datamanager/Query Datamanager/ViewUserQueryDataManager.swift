//
//  ViewUserQueryDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation

public class ViewUserQueryDataManager {
    public var databaseService: ViewUserQueryDatabaseServiceContract

    public init(databaseService: ViewUserQueryDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(response: [Query], callback: ([Query]) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension ViewUserQueryDataManager: ViewUserQueryDataContract {
    public func viewUserQuery(userId: Int, success: @escaping ([Query]) -> Void, failure: @escaping (String) -> Void) {
        databaseService.viewUserQuery(userId: userId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
