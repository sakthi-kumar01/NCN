//
//  ViewSubscription.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
import VTComponents
public final class ViewSubscriptionRequest: Request {}

public final class ViewSubscriptionResponse: Response {
    public var response: [AvailableSubscription]
    init(response: [AvailableSubscription]) {
        self.response = response
    }
}

public final class ViewSubscriptionError: ZError {
    public var error: String
    public init(error: String) {
        self.error = error
        super.init(status: .networkUnavailable)
    }
}

public final class ViewSubscription: ZUsecase<ViewSubscriptionRequest, ViewSubscriptionResponse, ViewSubscriptionError> {
    public var datamanger: ViewSubscriptionDataContract

    public init(datamanger: ViewSubscriptionDataContract) {
        self.datamanger = datamanger
    }

    override public func run(request _: ViewSubscriptionRequest, success: @escaping (ViewSubscriptionResponse) -> Void, failure: @escaping (ViewSubscriptionError) -> Void) {
        datamanger.viewSubscription(success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(error: message, callback: failure)
        })
    }
}

extension ViewSubscription {
    private func success(message: [AvailableSubscription], callback: @escaping (ViewSubscriptionResponse) -> Void) {
        let response = ViewSubscriptionResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: String, callback: @escaping (ViewSubscriptionError) -> Void) {
        let error = ViewSubscriptionError(error: error)
        invokeFailure(callback: callback, failure: error)
    }
}
