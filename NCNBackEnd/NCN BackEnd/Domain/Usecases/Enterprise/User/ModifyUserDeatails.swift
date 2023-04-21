//
//  ModifyUserDeatails.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents

public final class ModifyUserDetailsRequest: Request {
    public var userId: Int
    public var userName: String
    public var password: String
    public var eMail: String
    public var mobileNo: Int
   
    public init(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int) {
        self.userId = userId
        self.userName = userName
        self.password = password
        self.eMail = eMail
        self.mobileNo = mobileNo
        
    }
}

public final class ModifyUserDetailsResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class ModifyUserDetailsError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ModifyUserDetails: ZUsecase<ModifyUserDetailsRequest, ModifyUserDetailsResponse, ModifyUserDetailsError> {
    var dataManager: ModifyUserDetailsDataContract

    public init(dataManager: ModifyUserDetailsDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ModifyUserDetailsRequest, success: @escaping (ModifyUserDetailsResponse) -> Void, failure: @escaping (ModifyUserDetailsError) -> Void) {
        dataManager.modifyUserDetails(userId: request.userId, userName: request.userName, password: request.password, eMail: request.eMail, mobileNo: request.mobileNo
                                        ,success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ModifyUserDetailsError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (ModifyUserDetailsResponse) -> Void) {
        let response = ModifyUserDetailsResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ModifyUserDetailsError, callback: @escaping (ModifyUserDetailsError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}

