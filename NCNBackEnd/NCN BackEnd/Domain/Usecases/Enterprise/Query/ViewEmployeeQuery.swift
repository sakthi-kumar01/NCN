//
//  ViewEmployeeQuery.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents
public final class ViewEmployeeQueryRequest: Request {
    public var employeeId: Int

    public init(employeeId: Int) {
        self.employeeId = employeeId
    }
}

public final class ViewEmployeequeryMessage: ZResponse {
    public var response: [Query]
    public init(response: [Query]) {
        self.response = response
    }
}

public final class ViewEmployeeQueryError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ViewEmployeeQuery: ZUsecase<ViewEmployeeQueryRequest, ViewEmployeequeryMessage, ViewEmployeeQueryError> {
    var dataManager: ViewEmployeeQueryDataContract

    public init(dataManager: ViewEmployeeQueryDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ViewEmployeeQueryRequest, success: @escaping (ViewEmployeequeryMessage) -> Void, failure: @escaping (ViewEmployeeQueryError) -> Void) {
        dataManager.viewEmployeeQuery(employeeId: request.employeeId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ViewEmployeeQueryError(error: error), callback: failure)
        })
    }

    private func success(response: [Query], callback: @escaping (ViewEmployeequeryMessage) -> Void) {
        let response = ViewEmployeequeryMessage(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ViewEmployeeQueryError, callback: @escaping (ViewEmployeeQueryError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
