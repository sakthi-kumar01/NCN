//
//  TrackServiceClient.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import VTComponents

public final class TrackClientServiceRequest: Request {
    public var userId: Int

    public init(userId: Int) {
        self.userId = userId
    }
}

public final class TrackClientServiceResponse: ZResponse {
    public var response: [Service]
    public init(response: [Service]) {
        self.response = response
    }
}

public final class TrackClientServiceError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class TrackClientService: ZUsecase<TrackClientServiceRequest, TrackClientServiceResponse, TrackClientServiceError> {
    var dataManager: TrackClientServiceDataContract

    public init(dataManager: TrackClientServiceDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: TrackClientServiceRequest, success: @escaping (TrackClientServiceResponse) -> Void, failure: @escaping (TrackClientServiceError) -> Void) {
        dataManager.trackClientService(userId: request.userId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: TrackClientServiceError(error: error), callback: failure)
        })
    }

    private func success(message: [Service], callback: @escaping (TrackClientServiceResponse) -> Void) {
        let response = TrackClientServiceResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: TrackClientServiceError, callback: @escaping (TrackClientServiceError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
