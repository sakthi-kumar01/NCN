//
//  SearchEmployee.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import VTComponents
public final class SearchEmployeeRequest: Request {
    public var employeeId: Int

    public init(employeeId: Int) {
        self.employeeId = employeeId
    }
}

public final class SearchEmployeeResponse: ZResponse {
    public var response: [Employee]
    public init(response: [Employee]) {
        self.response = response
    }
}

public final class SearchEmployeeError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class SearchEmployee: ZUsecase<SearchEmployeeRequest, SearchEmployeeResponse, SearchEmployeeError> {
    var dataManager: SearchEmployeeDataContract

    public init(dataManager: SearchEmployeeDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: SearchEmployeeRequest, success: @escaping (SearchEmployeeResponse) -> Void, failure: @escaping (SearchEmployeeError) -> Void) {
        dataManager.searchEmployee(employeeId: request.employeeId, success: { [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: SearchEmployeeError(error: error), callback: failure)
        })
    }

    private func success(response: [Employee], callback: @escaping (SearchEmployeeResponse) -> Void) {
        let response = SearchEmployeeResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: SearchEmployeeError, callback: @escaping (SearchEmployeeError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}
