//
//  ModifyEmployeeDetails.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
import VTComponents

public final class ModifyEmployeeDetailsRequest: Request {
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

public final class ModifyEmployeeDetailsResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class ModifyEmployeeDetailsError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ModifyEmployeeDetails: ZUsecase<ModifyEmployeeDetailsRequest, ModifyEmployeeDetailsResponse, ModifyEmployeeDetailsError> {
    var dataManager: ModifyEmployeeDetailsDataContract

    public init(dataManager: ModifyEmployeeDetailsDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ModifyEmployeeDetailsRequest, success: @escaping (ModifyEmployeeDetailsResponse) -> Void, failure: @escaping (ModifyEmployeeDetailsError) -> Void) {
        dataManager.modifyEmployeeDetails(userId: request.userId, userName: request.userName, password: request.password, eMail: request.eMail, mobileNo: request.mobileNo, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ModifyEmployeeDetailsError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (ModifyEmployeeDetailsResponse) -> Void) {
        let response = ModifyEmployeeDetailsResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ModifyEmployeeDetailsError, callback: @escaping (ModifyEmployeeDetailsError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
