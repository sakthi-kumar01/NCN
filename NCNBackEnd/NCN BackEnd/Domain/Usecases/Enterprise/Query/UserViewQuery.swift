//
//  UserViewQuery.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents

public final class UserViewQueryRequest: Request {
    public var userId: Int
   
    public init(userId: Int) {
        self.userId = userId
        
    }
}

public final class UserViewQueryResponse: ZResponse {
    public var response: [Query]
    public init(response: [Query]) {
        self.response = response
    }
}

public final class UserViewQueryError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class UserViewQuery: ZUsecase<UserViewQueryRequest, UserViewQueryResponse, UserViewQueryError> {
    var dataManager: UserViewQueryDataContract

    public init(dataManager: UserViewQueryDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: UserViewQueryRequest, success: @escaping (UserViewQueryResponse) -> Void, failure: @escaping (UserViewQueryError) -> Void) {
        dataManager.userViewQuery(userId: request.userId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: UserViewQueryError(error: error), callback: failure)
        })
    }

    private func success(message: [Query], callback: @escaping (UserViewQueryResponse) -> Void) {
        let response = UserViewQueryResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: UserViewQueryError, callback: @escaping (UserViewQueryError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
