//
//  ModifyAvaialableSubscription.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
import VTComponents

public final class ModifyAvailableSubscriptionRequest: Request {
    public var subscriptionId: Int
    public var subscriptionPackageLimit: Float
    public var subscriptionCountLimit: Float
    public var subscriptionDayLimit: Int

    public init(subscriptionId: Int, subscriptionPackageLimit: Float, subscriptionCountLimit: Float, subscriptionDayLimit: Int) {
        self.subscriptionId = subscriptionId
        self.subscriptionCountLimit = subscriptionCountLimit
        self.subscriptionPackageLimit = subscriptionPackageLimit
        self.subscriptionDayLimit = subscriptionDayLimit
    }
}

public final class ModifyAvailableSubscriptionResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class ModifyAvailableSubscriptionError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ModifyAvailableSubscription: ZUsecase<ModifyAvailableSubscriptionRequest, ModifyAvailableSubscriptionResponse, ModifyAvailableSubscriptionError> {
    var dataManager: ModifyAvailableSubscriptionDataContract

    public init(dataManager: ModifyAvailableSubscriptionDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ModifyAvailableSubscriptionRequest, success: @escaping (ModifyAvailableSubscriptionResponse) -> Void, failure: @escaping (ModifyAvailableSubscriptionError) -> Void) {
        dataManager.modifyAvailableSubscription(subscriptionId: request.subscriptionId, subscriptionPackageLimit: request.subscriptionPackageLimit, subscriptionCountLimit: request.subscriptionCountLimit, subscriptionDayLimit: request.subscriptionDayLimit, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ModifyAvailableSubscriptionError(error: error), callback: failure)
        })
    }

    private func success(message: String, callback: @escaping (ModifyAvailableSubscriptionResponse) -> Void) {
        let response = ModifyAvailableSubscriptionResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ModifyAvailableSubscriptionError, callback: @escaping (ModifyAvailableSubscriptionError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
