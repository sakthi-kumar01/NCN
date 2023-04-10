//
//  TrackQuery.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import VTComponents
public final class TrackQueryRequest: Request {
    public var employeeId: Int

    public init(employeeId: Int) {
        self.employeeId = employeeId
    }
}

public final class TrackQueryResponse: ZResponse {
    public var response: [Query]
    public init(response: [Query]) {
        self.response = response
    }
}

public final class TrackQueryError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class TrackQuery: ZUsecase<TrackQueryRequest, TrackQueryResponse, TrackQueryError> {
    var dataManager: TrackQueryDataContract

    public init(dataManager: TrackQueryDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: TrackQueryRequest, success: @escaping (TrackQueryResponse) -> Void, failure: @escaping (TrackQueryError) -> Void) {
        dataManager.trackQuery(employeeId: request.employeeId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: TrackQueryError(error: error), callback: failure)
        })
    }

    private func success(message: [Query], callback: @escaping (TrackQueryResponse) -> Void) {
        let response = TrackQueryResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: TrackQueryError, callback: @escaping (TrackQueryError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
