//
//  ClientTrackService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import VTComponents

public final class ClientTrackServiceRequest: Request {
    public var userId: Int
    public var id: Int
    public var subscriptionUsage: Int
    public init(userId: Int, id: Int, subscriptionUsage: Int) {
        self.userId = userId
        self.id = id
        self.subscriptionUsage = subscriptionUsage
    }
}

public final class ClientTrackServiceResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class ClientTrackServiceError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ClientTrackService: ZUsecase<ClientTrackServiceRequest, ClientTrackServiceResponse, ClientTrackServiceError> {
    var dataManager: ClientTrackServiceDataContract

    public init(dataManager: ClientTrackServiceDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ClientTrackServiceRequest, success: @escaping (ClientTrackServiceResponse) -> Void, failure: @escaping (ClientTrackServiceError) -> Void) {
        dataManager.ClientTrackService(id: request.id, subscriptionUsage: request.subscriptionUsage, userId: request.userId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ClientTrackServiceError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (ClientTrackServiceResponse) -> Void) {
        let response = ClientTrackServiceResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ClientTrackServiceError, callback: @escaping (ClientTrackServiceError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
