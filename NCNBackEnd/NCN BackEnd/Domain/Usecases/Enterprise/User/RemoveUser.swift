//
//  RemoveUser.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents

public final class RemoveUserRequest: Request {
    public var userId: Int

    public init(userId: Int) {
        self.userId = userId
    }
}

public final class RemoveUserResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class RemoveUserError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class RemoveUser: ZUsecase<RemoveUserRequest, RemoveUserResponse, RemoveUserError> {
    var dataManager: RemoveUserDataContract

    public init(dataManager: RemoveUserDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: RemoveUserRequest, success: @escaping (RemoveUserResponse) -> Void, failure: @escaping (RemoveUserError) -> Void) {
        dataManager.removeUser(userId: request.userId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: RemoveUserError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (RemoveUserResponse) -> Void) {
        let response = RemoveUserResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: RemoveUserError, callback: @escaping (RemoveUserError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
