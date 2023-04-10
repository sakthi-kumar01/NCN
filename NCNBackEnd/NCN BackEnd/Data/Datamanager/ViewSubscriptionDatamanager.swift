//
//  ViewSubscriptionDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
public class ViewSubscriptionDatamanager {
    var databaseService: ViewSubscriptionDatabaseContract
    public init(databaseService: ViewSubscriptionDatabaseContract) {
        self.databaseService = databaseService
    }

    private func success(message: [AvailableSubscription], callback: ([AvailableSubscription]) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "No Data" {
            let error = "Service already exist"
            callback(error)
        }
    }
}

extension ViewSubscriptionDatamanager: ViewSubscriptionDataContract {
    public func viewSubscription(success: @escaping ([AvailableSubscription]) -> Void, failure: @escaping (String) -> Void) {
        databaseService.viewSubscription(success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
