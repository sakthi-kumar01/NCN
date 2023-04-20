//
//  CreateAvailableSubscription.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 25/03/23.
//

import Foundation
import VTComponents

public final class CreateAvailableSubscriptionRequest: Request {
    public var subscriptionId: Int
    public var subscriptionPackageType: String
    public var subscriptionConuntLimit: Float
    public var subscriptionDaylimit: Int
    public var serviceId: Int

    public init(subscriptionId: Int, subscriptionPackageType: String, subscriptionConuntLimit: Float, subscriptionDaylimit: Int, serviceId: Int) {
        self.subscriptionId = subscriptionId
        self.subscriptionPackageType = subscriptionPackageType
        self.subscriptionConuntLimit = subscriptionConuntLimit
        self.subscriptionDaylimit = subscriptionDaylimit
        self.serviceId = serviceId
    }
}

public final class CreateAvailableSubscriptionResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class CreateAvailableSubscriptionError: ZError {
    public var error: String
    public init(error: String) {
        self.error = error
        super.init(status: .networkUnavailable)
    }
}

public final class CreateAvailableSubscription: ZUsecase<CreateAvailableSubscriptionRequest, CreateAvailableSubscriptionResponse, CreateAvailableSubscriptionError> {
    public var datamanager: CreateAvailableSubscriptionDataContract

    public init(datamanager: CreateAvailableSubscriptionDataContract) {
        self.datamanager = datamanager
    }

    override public func run(request: CreateAvailableSubscriptionRequest, success: @escaping (CreateAvailableSubscriptionResponse) -> Void, failure: @escaping (CreateAvailableSubscriptionError) -> Void) {
        datamanager.createAvailableSubscription(subscriptionId: request.subscriptionId, subscriptionPackageType: request.subscriptionPackageType, subscriptionConuntLimit: request.subscriptionConuntLimit, subscriptionDaylimit: request.subscriptionDaylimit, serviceId: request.serviceId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(error: message, callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (CreateAvailableSubscriptionResponse) -> Void) {
        let response = CreateAvailableSubscriptionResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: String, callback: @escaping (CreateAvailableSubscriptionError) -> Void) {
        let error = CreateAvailableSubscriptionError(error: error)
        invokeFailure(callback: callback, failure: error)
    }
}
