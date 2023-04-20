//
//  SearchClient.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
import VTComponents
public final class SearchClientRequest: Request {
    public var employeeId: Int
    public var userId: Int

    public init(userId:Int, employeeId: Int) {
        self.employeeId = employeeId
        self.userId = userId
    }
}

public final class SearchClientResponse: ZResponse {
    public var response: [User]
    public init(response: [User]) {
        self.response = response
    }
}

public final class SearchClientError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class SearchClient: ZUsecase<SearchClientRequest, SearchClientResponse, SearchClientError> {
    var dataManager: SearchClientDataContract

    public init(dataManager: SearchClientDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: SearchClientRequest, success: @escaping (SearchClientResponse) -> Void, failure: @escaping (SearchClientError) -> Void) {
        dataManager.searchClient(userId: request.userId, employeeId: request.employeeId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: SearchClientError(error: error), callback: failure)
        })
    }

    private func success(message: [User], callback: @escaping (SearchClientResponse) -> Void) {
        let response = SearchClientResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: SearchClientError, callback: @escaping (SearchClientError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
