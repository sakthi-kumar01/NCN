//
//  ModifyAvaialableService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
import VTComponents

public final class ModifyAvailableServiceRequest: Request {
    public var serviceId: Int
    public var serviceTitle: String
    public var serviceDescription: String

    public init(serviceId: Int, serviceTitle: String, serviceDescription: String) {
        self.serviceId = serviceId
        self.serviceTitle = serviceTitle
        self.serviceDescription = serviceDescription
    }
}

public final class ModifyAvailableServiceResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class ModifyAvailableServiceError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ModifyAvailableService: ZUsecase<ModifyAvailableServiceRequest, ModifyAvailableServiceResponse, ModifyAvailableServiceError> {
    var dataManager: ModifyAvailableServiceDataContract

    public init(dataManager: ModifyAvailableServiceDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ModifyAvailableServiceRequest, success: @escaping (ModifyAvailableServiceResponse) -> Void, failure: @escaping (ModifyAvailableServiceError) -> Void) {
        dataManager.modifyAvailableService(serviceId: request.serviceId, serviceTitle: request.serviceTitle, serviceDescription: request.serviceDescription, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ModifyAvailableServiceError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (ModifyAvailableServiceResponse) -> Void) {
        let response = ModifyAvailableServiceResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ModifyAvailableServiceError, callback: @escaping (ModifyAvailableServiceError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
