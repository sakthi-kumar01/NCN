//
//  AdminViewCLient.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import VTComponents

public final class AdminViewClientRequest: Request {
    public var employeeId: Int

    public init(employeeId: Int) {
        self.employeeId = employeeId
    }
}

public final class AdminViewClientResponse: ZResponse {
    public var response: [User]
    public init(response: [User]) {
        self.response = response
    }
}

public final class AdminViewClientError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class AdminViewClient: ZUsecase<AdminViewClientRequest, AdminViewClientResponse, AdminViewClientError> {
    var dataManager: AdminViewClientDataContract

    public init(dataManager: AdminViewClientDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: AdminViewClientRequest, success: @escaping (AdminViewClientResponse) -> Void, failure: @escaping (AdminViewClientError) -> Void) {
        dataManager.adminViewClient(employeeId: request.employeeId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: AdminViewClientError(error: error), callback: failure)
        })
    }

    private func success(message: [User], callback: @escaping (AdminViewClientResponse) -> Void) {
        let response = AdminViewClientResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: AdminViewClientError, callback: @escaping (AdminViewClientError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}

public protocol AdminViewClientDataContract {
    func adminViewClient(employeeId: Int, success: @escaping ([User]) -> Void, failure: @escaping (String) -> Void)
}
