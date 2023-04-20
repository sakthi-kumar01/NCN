//
//  ViewEmployeeQuery.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents
public final class ViewEmployeeQueryRequest: Request {
    public var employeeId: Int
   
    public init(employeeId: Int) {
        self.employeeId = employeeId
        
    }
}

public final class ViewEmployeeQueryResponse: ZResponse {
    public var response: [Query]
    public init(response: [Query]) {
        self.response = response
    }
}

public final class ViewEmployeeQueryError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class ViewEmployeeQuery: ZUsecase<ViewEmployeeQueryRequest, ViewEmployeeQueryResponse, ViewEmployeeQueryError> {
    var dataManager: ViewEmployeeQueryDataContract

    public init(dataManager: ViewEmployeeQueryDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: ViewEmployeeQueryRequest, success: @escaping (ViewEmployeeQueryResponse) -> Void, failure: @escaping (ViewEmployeeQueryError) -> Void) {
        dataManager.viewEmployeeQuery(employeeId: request.employeeId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: ViewEmployeeQueryError(error: error), callback: failure)
        })
    }

    private func success(message: [Query], callback: @escaping (ViewEmployeeQueryResponse) -> Void) {
        let response = ViewEmployeeQueryResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: ViewEmployeeQueryError, callback: @escaping (ViewEmployeeQueryError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}

