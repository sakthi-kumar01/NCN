//
//  ModifyUserDeatails.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents

public final class ModifyStringDetailsRequest: Request {
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

public final class ModifyStringDetailsResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class ModifyStringDetailsError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ModifyStringDetails: ZUsecase<ModifyStringDetailsRequest, ModifyStringDetailsResponse, ModifyStringDetailsError> {
    var dataManager: ModifyStringDetailsDataContract

    public init(dataManager: ModifyStringDetailsDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ModifyStringDetailsRequest, success: @escaping (ModifyStringDetailsResponse) -> Void, failure: @escaping (ModifyStringDetailsError) -> Void) {
        dataManager.modifyStringDetails(userId: request.userId, userName: request.userName, password: request.password, eMail: request.eMail, mobileNo: request.mobileNo
                                        ,success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ModifyStringDetailsError(error: error), callback: failure)
        })
    }

    private func success(message: String, callback: @escaping (ModifyStringDetailsResponse) -> Void) {
        let response = ModifyStringDetailsResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ModifyStringDetailsError, callback: @escaping (ModifyStringDetailsError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}

