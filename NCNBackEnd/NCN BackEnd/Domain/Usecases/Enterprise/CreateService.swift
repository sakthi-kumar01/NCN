//
//  CreateService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
import VTComponents
public final class CreateAvailableServiceRequest: Request {
    public var serviceId: Int
    public var serviceTitle: String
    public var serviceDescription: String
    public init(serviceId: Int, serviceTitle: String, serviceDescription: String) {
        self.serviceId = serviceId
        self.serviceTitle = serviceTitle
        self.serviceDescription = serviceDescription
    }
}

public final class CreateAvailableServiceResponse: ZResponse {
    public var response: AvailableService
    public init(response: AvailableService) {
        self.response = response
    }
}

public final class CreateAvailableServiceError: ZError {
    public var error: String
    public init(error: String) {
        self.error = error
        super.init(status: .networkUnavailable)
    }
}

public final class CreateAvailableService: ZUsecase<CreateAvailableServiceRequest, CreateAvailableServiceResponse, CreateAvailableServiceError> {
    var datamanager: CreateAvailableServicesDataContract

    public init(datamanager: CreateAvailableServicesDataContract) {
        self.datamanager = datamanager
    }

    override public func run(request: CreateAvailableServiceRequest, success: @escaping (CreateAvailableServiceResponse) -> Void, failure: @escaping (CreateAvailableServiceError) -> Void) {
        datamanager.createAvalableServices(serviceId: request.serviceId, serviceTitle: request.serviceTitle, serviceDescritpion: request.serviceDescription, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(error: CreateAvailableServiceError(error: message), callback: failure)
        })
    }

    private func success(message: AvailableService, callback: @escaping (CreateAvailableServiceResponse) -> Void) {
        let response = CreateAvailableServiceResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: CreateAvailableServiceError, callback: @escaping (CreateAvailableServiceError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
