//
//  ViewAdminClient.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import VTComponents

public final class ViewAdminClientRequest: Request {
    public var employeeId: Int

    public init(employeeId: Int) {
        self.employeeId = employeeId
    }
}

public final class ViewAdminClientResponse: ZResponse {
    public var response: [User]
    public init(response: [User]) {
        self.response = response
    }
}

public final class ViewAdminClientError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ViewAdminClient: ZUsecase<ViewAdminClientRequest, ViewAdminClientResponse, ViewAdminClientError> {
    var dataManager: ViewAdminClientDataContract

    public init(dataManager: ViewAdminClientDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ViewAdminClientRequest, success: @escaping (ViewAdminClientResponse) -> Void, failure: @escaping (ViewAdminClientError) -> Void) {
        dataManager.viewAdminClient(employeeId: request.employeeId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ViewAdminClientError(error: error), callback: failure)
        })
    }

    private func success(response: [User], callback: @escaping (ViewAdminClientResponse) -> Void) {
        let response = ViewAdminClientResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ViewAdminClientError, callback: @escaping (ViewAdminClientError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
