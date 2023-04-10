//
//  EmployeeViewQuery.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents
public final class EmployeeViewQueryRequest: Request {
    public var employeeId: Int
   
    public init(employeeId: Int) {
        self.employeeId = employeeId
        
    }
}

public final class EmployeeViewQueryResponse: ZResponse {
    public var response: [Query]
    public init(response: [Query]) {
        self.response = response
    }
}

public final class EmployeeViewQueryError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class EmployeeViewQuery: ZUsecase<EmployeeViewQueryRequest, EmployeeViewQueryResponse, EmployeeViewQueryError> {
    var dataManager: EmployeeViewQueryDataContract

    public init(dataManager: EmployeeViewQueryDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: EmployeeViewQueryRequest, success: @escaping (EmployeeViewQueryResponse) -> Void, failure: @escaping (EmployeeViewQueryError) -> Void) {
        dataManager.employeeViewQuery(employeeId: request.employeeId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: EmployeeViewQueryError(error: error), callback: failure)
        })
    }

    private func success(message: [Query], callback: @escaping (EmployeeViewQueryResponse) -> Void) {
        let response = EmployeeViewQueryResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: EmployeeViewQueryError, callback: @escaping (EmployeeViewQueryError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}

