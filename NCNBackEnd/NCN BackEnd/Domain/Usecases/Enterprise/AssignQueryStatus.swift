//
//  AssignQueryStatus.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 08/04/23.
//

import Foundation
import VTComponents

public final class AssignQueryStatusRequest: Request {
    public var queryId: Int

    public init(queryId: Int) {
        self.queryId = queryId
    }
}

public final class AssignQueryStatusResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class AssignQueryStatusError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class AssignQueryStatus: ZUsecase<AssignQueryStatusRequest, AssignQueryStatusResponse, AssignQueryStatusError> {
    var dataManager: AssignQueryStatusDataContract

    public init(dataManager: AssignQueryStatusDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: AssignQueryStatusRequest, success: @escaping (AssignQueryStatusResponse) -> Void, failure: @escaping (AssignQueryStatusError) -> Void) {
        dataManager.assignQueryStatus(queryId: request.queryId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: AssignQueryStatusError(error: error), callback: failure)
        })
    }

    private func success(message: String, callback: @escaping (AssignQueryStatusResponse) -> Void) {
        let response = AssignQueryStatusResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: AssignQueryStatusError, callback: @escaping (AssignQueryStatusError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
