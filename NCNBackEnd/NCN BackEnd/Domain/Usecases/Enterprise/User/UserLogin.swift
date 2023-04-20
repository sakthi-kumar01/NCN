//
//  UserLogin.swift
//  NifyBackEnd
//
//  Created by raja-16327 on 10/03/23.
//

import Foundation
import VTComponents
public final class UserLoginRequest: Request {
    public var userName: String
    public var password: String
    public init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
}

public final class UserLoginResponse: ZResponse {
    public var response: User
    public init(response: User) {
        self.response = response
    }
}

public final class UserLoginError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class UserLogin: ZUsecase<UserLoginRequest, UserLoginResponse, UserLoginError> {
    var dataManager: UserLoginDataContract

    public init(dataManager: UserLoginDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: UserLoginRequest, success: @escaping (UserLoginResponse) -> Void, failure: @escaping (UserLoginError) -> Void) {
        dataManager.userLogin(userName: request.userName, password: request.password, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: UserLoginError(error: error), callback: failure)
        })
    }

    private func success(message: User, callback: @escaping (UserLoginResponse) -> Void) {
        let response = UserLoginResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: UserLoginError, callback: @escaping (UserLoginError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
