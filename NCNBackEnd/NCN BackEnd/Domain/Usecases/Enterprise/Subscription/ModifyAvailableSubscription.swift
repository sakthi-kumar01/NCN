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
    public var subscriptionPackageType: String
    public var subscriptionCountLimit: Float
    public var subscriptionDayLimit: Int

    public init(subscriptionId: Int, subscriptionPackageType: String, subscriptionCountLimit: Float, subscriptionDayLimit: Int) {
        self.subscriptionId = subscriptionId
        self.subscriptionCountLimit = subscriptionCountLimit
        self.subscriptionPackageType = subscriptionPackageType
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
        dataManager.modifyAvailableSubscription(subscriptionId: request.subscriptionId, subscriptionPackageType: request.subscriptionPackageType, subscriptionCountLimit: request.subscriptionCountLimit, subscriptionDayLimit: request.subscriptionDayLimit, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ModifyAvailableSubscriptionError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (ModifyAvailableSubscriptionResponse) -> Void) {
        let response = ModifyAvailableSubscriptionResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ModifyAvailableSubscriptionError, callback: @escaping (ModifyAvailableSubscriptionError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
