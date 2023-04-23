//
//  ViewUserQuery.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents

public final class ViewUserQueryRequest: Request {
    public var userId: Int

    public init(userId: Int) {
        self.userId = userId
    }
}

public final class ViewUserqueryMessage: ZResponse {
    public var response: [Query]
    public init(response: [Query]) {
        self.response = response
    }
}

public final class ViewUserQueryError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ViewUserQuery: ZUsecase<ViewUserQueryRequest, ViewUserqueryMessage, ViewUserQueryError> {
    var dataManager: ViewUserQueryDataContract

    public init(dataManager: ViewUserQueryDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ViewUserQueryRequest, success: @escaping (ViewUserqueryMessage) -> Void, failure: @escaping (ViewUserQueryError) -> Void) {
        dataManager.viewUserQuery(userId: request.userId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ViewUserQueryError(error: error), callback: failure)
        })
    }

    private func success(response: [Query], callback: @escaping (ViewUserqueryMessage) -> Void) {
        let response = ViewUserqueryMessage(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ViewUserQueryError, callback: @escaping (ViewUserQueryError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
