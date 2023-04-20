//
//  AddNewUser.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/03/23.
//

import Foundation
import VTComponents
public class AddNewUserRequest: Request {
    public var UserName: String
    public var password: String
    public var email: String
    public var mobileNumber: Int64
    public var enterpriseId: Int
    public init(UserName: String, password: String, email: String, mobileNumber: Int64, enterpriseId: Int) {
        self.UserName = UserName
        self.password = password
        self.email = email
        self.mobileNumber = mobileNumber
        self.enterpriseId = enterpriseId
    }
}

public class AddNewUserResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class AddNewUserError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class AddNewUser: ZUsecase<AddNewUserRequest, AddNewUserResponse, AddNewUserError> {
    var dataManager: AddNewUserDataContract

    public init(dataManager: AddNewUserDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: AddNewUserRequest, success: @escaping (AddNewUserResponse) -> Void, failure: @escaping (AddNewUserError) -> Void) {
        dataManager.addNewUser(userName: request.UserName, password: request.password, email: request.email, mobileNumber: request.mobileNumber, enterpriseId: request.enterpriseId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: AddNewUserError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (AddNewUserResponse) -> Void) {
        let response = AddNewUserResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: AddNewUserError, callback: @escaping (AddNewUserError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
