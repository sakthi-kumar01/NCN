//
//  RemoveService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents

public final class RemoveServiceRequest: Request {
    public var serviceId: Int
   
    public init(serviceId: Int) {
        self.serviceId = serviceId
        
    }
}

public final class RemoveServiceResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class RemoveServiceError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class RemoveService: ZUsecase<RemoveServiceRequest, RemoveServiceResponse, RemoveServiceError> {
    var dataManager: RemoveServiceDataContract

    public init(dataManager: RemoveServiceDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: RemoveServiceRequest, success: @escaping (RemoveServiceResponse) -> Void, failure: @escaping (RemoveServiceError) -> Void) {
        dataManager.removeService(serviceId: request.serviceId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: RemoveServiceError(error: error), callback: failure)
        })
    }

    private func success(message: String, callback: @escaping (RemoveServiceResponse) -> Void) {
        let response = RemoveServiceResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: RemoveServiceError, callback: @escaping (RemoveServiceError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
