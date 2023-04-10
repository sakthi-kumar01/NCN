//
//  EmployeeViewClient.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
import VTComponents
public final class EmployeeViewClientRequest: Request {
    public var employeeId: Int

    public init(employeeId: Int) {
        self.employeeId = employeeId
    }
}

public final class EmployeeViewClientResponse: ZResponse {
    public var response: [User]
    public init(response: [User]) {
        self.response = response
    }
}

public final class EmployeeViewClientError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class EmployeeViewClient: ZUsecase<EmployeeViewClientRequest, EmployeeViewClientResponse, EmployeeViewClientError> {
    var dataManager: EmployeeViewClientDataContract

    public init(dataManager: EmployeeViewClientDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: EmployeeViewClientRequest, success: @escaping (EmployeeViewClientResponse) -> Void, failure: @escaping (EmployeeViewClientError) -> Void) {
        dataManager.employeeViewClient(employeeId: request.employeeId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: EmployeeViewClientError(error: error), callback: failure)
        })
    }

    private func success(message: [User], callback: @escaping (EmployeeViewClientResponse) -> Void) {
        let response = EmployeeViewClientResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: EmployeeViewClientError, callback: @escaping (EmployeeViewClientError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
