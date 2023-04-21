//
//  GetEnterprise.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/04/23.
//

import Foundation
import VTComponents
public final class GetEnterpriseNameRequest: Request {
    
   
    public override init() {
       
        
    }
}

public final class GetEnterpriseNameResponse: ZResponse {
    public var response: Enterprise
    public init(response: Enterprise) {
        self.response = response
    }
}

public final class GetEnterpriseNameError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class GetEnterpriseName: ZUsecase<GetEnterpriseNameRequest, GetEnterpriseNameResponse, GetEnterpriseNameError> {
    var dataManager: GetEnterpriseNameDataContract

    public init(dataManager: GetEnterpriseNameDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: GetEnterpriseNameRequest, success: @escaping (GetEnterpriseNameResponse) -> Void, failure: @escaping (GetEnterpriseNameError) -> Void) {
        dataManager.getEnterpriseName( success: { [weak self] response in
            self?.success(response: response, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: GetEnterpriseNameError(error: error), callback: failure)
        })
    }

    private func success(response: Enterprise, callback: @escaping (GetEnterpriseNameResponse) -> Void) {
        let response = GetEnterpriseNameResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: GetEnterpriseNameError, callback: @escaping (GetEnterpriseNameError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
