//
//  RemoveAvailableService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents

public final class RemoveAvailableServiceRequest: Request {
    public var serviceId: Int
   
    public init(serviceId: Int) {
        self.serviceId = serviceId
        
    }
}

public final class RemoveAvailableServiceResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class RemoveAvailableServiceError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class RemoveAvailableService: ZUsecase<RemoveAvailableServiceRequest, RemoveAvailableServiceResponse, RemoveAvailableServiceError> {
    var dataManager: RemoveAvailableServiceDataContract

    public init(dataManager: RemoveAvailableServiceDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: RemoveAvailableServiceRequest, success: @escaping (RemoveAvailableServiceResponse) -> Void, failure: @escaping (RemoveAvailableServiceError) -> Void) {
        dataManager.removeAvailableService(serviceId: request.serviceId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: RemoveAvailableServiceError(error: error), callback: failure)
        })
    }

    private func success(message: String, callback: @escaping (RemoveAvailableServiceResponse) -> Void) {
        let response = RemoveAvailableServiceResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: RemoveAvailableServiceError, callback: @escaping (RemoveAvailableServiceError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
