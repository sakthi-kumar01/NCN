//
//  ViewService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 22/03/23.
//

import Foundation
import VTComponents
public final class ViewServiceRequest: Request {}

public final class ViewServiceResponse: ZResponse {
    public var response: [AvailableService]
    public init(response: [AvailableService]) {
        self.response = response
    }
}

public final class ViewServiceError: ZError {
    public var error: String
    public init(error: String) {
        self.error = error
        super.init(status: .networkUnavailable)
    }
}

public final class ViewService: ZUsecase<ViewServiceRequest, ViewServiceResponse, ViewServiceError> {
    var dataManager: ViewServiceDatacontract
    public init(dataManager: ViewServiceDatacontract) {
        self.dataManager = dataManager
    }

    override public func run(request _: ViewServiceRequest, success: @escaping (ViewServiceResponse) -> Void, failure: @escaping (ViewServiceError) -> Void) {
        dataManager.viewService(success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(error: message, callback: failure)
        })
    }

    private func success(response: [AvailableService], callback: @escaping (ViewServiceResponse) -> Void) {
        let response = ViewServiceResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: String, callback: @escaping (ViewServiceError) -> Void) {
        let error = ViewServiceError(error: error)
        invokeFailure(callback: callback, failure: error)
    }
}
