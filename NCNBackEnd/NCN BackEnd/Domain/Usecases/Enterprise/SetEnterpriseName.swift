//
//  SetEnterpriseName.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
import VTComponents
public final class SetEnterpriseNameRequest: Request {
    public var enterpriseName: String
    public init(enterpriseName: String) {
        self.enterpriseName = enterpriseName
    }
}

public final class SetEnterpriseNameResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class SetEnterpriseNameError: ZError {
    public var error: String
    public init(error: String) {
        self.error = error
        super.init(status: .networkUnavailable)
    }
}

public final class SetEnterpriseName: ZUsecase<SetEnterpriseNameRequest, SetEnterpriseNameResponse, SetEnterpriseNameError> {
    var dataManager: SetEnterpriseNameDataContract
    public init(dataManager: SetEnterpriseNameDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: SetEnterpriseNameRequest, success: @escaping (SetEnterpriseNameResponse) -> Void, failure: @escaping (SetEnterpriseNameError) -> Void) {
        dataManager.setEnterpriseName(enterpriseName: request.enterpriseName, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(error: SetEnterpriseNameError(error: message), callback: failure)
        })
    }

    private func success(message: String, callback: @escaping (SetEnterpriseNameResponse) -> Void) {
        let response = SetEnterpriseNameResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: SetEnterpriseNameError, callback: @escaping (SetEnterpriseNameError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
