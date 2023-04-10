//
//  TrackService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import VTComponents

public final class TrackServiceRequest: Request {
    public var employeeId: Int

    public init(employeeId: Int) {
        self.employeeId = employeeId
    }
}

public final class TrackServiceResponse: ZResponse {
    public var response: [Service]
    public init(response: [Service]) {
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
        dataManager.trackService(employeeId: request.employeeId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: TrackServiceError(error: error), callback: failure)
        })
    }

    private func success(message: [Service], callback: @escaping (TrackServiceResponse) -> Void) {
        let response = TrackServiceResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: TrackServiceError, callback: @escaping (TrackServiceError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
