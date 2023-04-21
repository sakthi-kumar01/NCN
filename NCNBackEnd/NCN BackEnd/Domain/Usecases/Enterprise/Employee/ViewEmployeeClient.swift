//
//  ViewEmployeeClient.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
import VTComponents
public final class ViewEmployeeClientRequest: Request {
    public var employeeId: Int

    public init(employeeId: Int) {
        self.employeeId = employeeId
    }
}

public final class ViewEmployeeClientResponse: ZResponse {
    public var response: [User]
    public init(response: [User]) {
        self.response = response
    }
}

public final class ViewEmployeeClientError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ViewEmployeeClient: ZUsecase<ViewEmployeeClientRequest, ViewEmployeeClientResponse, ViewEmployeeClientError> {
    var dataManager: ViewEmployeeClientDataContract

    public init(dataManager: ViewEmployeeClientDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ViewEmployeeClientRequest, success: @escaping (ViewEmployeeClientResponse) -> Void, failure: @escaping (ViewEmployeeClientError) -> Void) {
        dataManager.viewEmployeeClient(employeeId: request.employeeId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ViewEmployeeClientError(error: error), callback: failure)
        })
    }

    private func success(response: [User], callback: @escaping (ViewEmployeeClientResponse) -> Void) {
        let response = ViewEmployeeClientResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ViewEmployeeClientError, callback: @escaping (ViewEmployeeClientError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
