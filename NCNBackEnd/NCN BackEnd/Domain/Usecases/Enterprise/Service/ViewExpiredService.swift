//
//  ViewExpiredService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
import VTComponents

public final class ViewExpiredServiceRequest: Request {}

public final class ViewExpiredServiceResponse: ZResponse {
    public var response: [[String]]
    public init(response: [[String]]) {
        self.response = response
    }
}

public final class ViewExpiredServiceError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ViewExpiredService: ZUsecase<ViewExpiredServiceRequest, ViewExpiredServiceResponse, ViewExpiredServiceError> {
    var dataManager: ViewExpiredServiceDataContract

    public init(dataManager: ViewExpiredServiceDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request _: ViewExpiredServiceRequest, success: @escaping (ViewExpiredServiceResponse) -> Void, failure: @escaping (ViewExpiredServiceError) -> Void) {
        dataManager.viewExpiredService(success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ViewExpiredServiceError(error: error), callback: failure)
        })
    }

    private func success(response: [[String]], callback: @escaping (ViewExpiredServiceResponse) -> Void) {
        let response = ViewExpiredServiceResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ViewExpiredServiceError, callback: @escaping (ViewExpiredServiceError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
