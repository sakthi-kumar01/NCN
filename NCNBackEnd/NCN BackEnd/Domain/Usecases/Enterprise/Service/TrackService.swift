//
//  TrackService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import VTComponents

public final class TrackServiceRequest: Request {
    public var id: Int
    public var employeeId: Int
    public var subscriptionUsage: Int
    public init(id: Int, subscriptionUsage: Int, employeeId: Int) {
        self.id = id
        self.employeeId = employeeId
        self.subscriptionUsage = subscriptionUsage
    }
}

public final class TrackServiceResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class TrackServiceError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class TrackService: ZUsecase<TrackServiceRequest, TrackServiceResponse, TrackServiceError> {
    var dataManager: TrackServiceDataContract

    public init(dataManager: TrackServiceDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: TrackServiceRequest, success: @escaping (TrackServiceResponse) -> Void, failure: @escaping (TrackServiceError) -> Void) {
        dataManager.trackService(id: request.id, subscriptionUsage: request.subscriptionUsage, employeeId: request.employeeId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: TrackServiceError(error: error), callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (TrackServiceResponse) -> Void) {
        let response = TrackServiceResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: TrackServiceError, callback: @escaping (TrackServiceError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
