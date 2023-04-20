//
//  RemoveSubscription.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents
public final class RemoveSubscriptionRequest: Request {
    public var subscriptionId: Int
   
    public init(subscriptionId: Int) {
        self.subscriptionId = subscriptionId
        
    }
}

public final class RemoveSubscriptionResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class RemoveSubscriptionError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class RemoveSubscription: ZUsecase<RemoveSubscriptionRequest, RemoveSubscriptionResponse, RemoveSubscriptionError> {
    var dataManager: RemoveSubscriptionDataContract

    public init(dataManager: RemoveSubscriptionDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: RemoveSubscriptionRequest, success: @escaping (RemoveSubscriptionResponse) -> Void, failure: @escaping (RemoveSubscriptionError) -> Void) {
        dataManager.removeSubscription(subscriptionId: request.subscriptionId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: RemoveSubscriptionError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (RemoveSubscriptionResponse) -> Void) {
        let response = RemoveSubscriptionResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: RemoveSubscriptionError, callback: @escaping (RemoveSubscriptionError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
