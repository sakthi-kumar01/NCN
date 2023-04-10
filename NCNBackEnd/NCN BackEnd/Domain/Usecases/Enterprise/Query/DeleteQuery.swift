//
//  DeleteQuery.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents


public final class DeleteQueryRequest: Request {
    public var queryId: Int
   
    public init(queryId: Int) {
        self.queryId = queryId
        
    }
}

public final class DeleteQueryResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class DeleteQueryError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class DeleteQuery: ZUsecase<DeleteQueryRequest, DeleteQueryResponse, DeleteQueryError> {
    var dataManager: DeleteQueryDataContract

    public init(dataManager: DeleteQueryDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: DeleteQueryRequest, success: @escaping (DeleteQueryResponse) -> Void, failure: @escaping (DeleteQueryError) -> Void) {
        dataManager.deleteQuery(queryId: request.queryId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: DeleteQueryError(error: error), callback: failure)
        })
    }

    private func success(message: String, callback: @escaping (DeleteQueryResponse) -> Void) {
        let response = DeleteQueryResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: DeleteQueryError, callback: @escaping (DeleteQueryError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
