//
//  ViewSubscriptionDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
public class ViewSubscriptionDatamanager {
    var databaseService: ViewSubscriptionDatabaseServiceContract
    public init(databaseService: ViewSubscriptionDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(response: [AvailableSubscription], callback: ([AvailableSubscription]) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No Data" {
            let error = "Service already exist"
            callback(error)
        }
    }
}

extension ViewSubscriptionDatamanager: ViewSubscriptionDataContract {
    public func viewSubscription(success: @escaping ([AvailableSubscription]) -> Void, failure: @escaping (String) -> Void) {
        databaseService.viewSubscription(success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
