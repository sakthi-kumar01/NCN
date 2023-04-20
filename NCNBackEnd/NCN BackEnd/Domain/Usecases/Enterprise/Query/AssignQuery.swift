//
//  AssignQuery.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 08/04/23.
//

import Foundation
import VTComponents

public final class AssignQueryRequest: Request {
    public var queryId: Int
    public var employeeId: Int

    public init(employeeId: Int, queryId: Int) {
        self.employeeId = employeeId
        self.queryId = queryId
    }
}

public final class AssignqueryMessage: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class AssignQueryError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class AssignQuery: ZUsecase<AssignQueryRequest, AssignqueryMessage, AssignQueryError> {
    var dataManager: AssignQueryDataContract

    public init(dataManager: AssignQueryDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: AssignQueryRequest, success: @escaping (AssignqueryMessage) -> Void, failure: @escaping (AssignQueryError) -> Void) {
        dataManager.assignQuery(employeeId: request.employeeId, queryId: request.queryId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: AssignQueryError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (AssignqueryMessage) -> Void) {
        let response = AssignqueryMessage(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: AssignQueryError, callback: @escaping (AssignQueryError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
