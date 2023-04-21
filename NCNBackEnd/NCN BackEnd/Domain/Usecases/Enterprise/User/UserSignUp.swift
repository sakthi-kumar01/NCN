//
//  UserSignUp.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/04/23.
//

import Foundation
import VTComponents

public final class UserSignUpRequest: Request {
    public var userName: String
    public var password: String
    public var email: String
    public var mobileNumber: Int
   
    public init(userName: String, password: String, email: String, mobileNumber: Int) {
        self.userName =  userName
        self.password = password
        self.email = email
        self.mobileNumber =  mobileNumber
        
    }
}

public final class UserSignUpResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class UserSignUpError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class UserSignUp: ZUsecase<UserSignUpRequest, UserSignUpResponse, UserSignUpError> {
    var dataManager: UserSignUpDataContract

    public init(dataManager: UserSignUpDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: UserSignUpRequest, success: @escaping (UserSignUpResponse) -> Void, failure: @escaping (UserSignUpError) -> Void) {
        dataManager.userSignUp(userName: request.userName, password: request.password, email: request.email, mobileNumber: request.mobileNumber , success: { [weak self] response in
            self?.success(response: response, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: UserSignUpError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (UserSignUpResponse) -> Void) {
        let response = UserSignUpResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: UserSignUpError, callback: @escaping (UserSignUpError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
