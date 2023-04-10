//
//  RemoveEmployee.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import VTComponents

public final class RemoveEmployeeRequest: Request {
    public var employeeId: Int
    public var userId: Int
   
    public init(employeeId: Int, userId: Int) {
        self.employeeId = employeeId
        self.userId = userId
        
    }
}

public final class RemoveEmployeeResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class RemoveEmployeeError: ZError {
    public var error: String
    init(error: String) {
        self.error = error
        super.init(status: .irresponsiveDatabase)
    }
}

public final class RemoveEmployee: ZUsecase<RemoveEmployeeRequest, RemoveEmployeeResponse, RemoveEmployeeError> {
    var dataManager: RemoveEmployeeDataContract

    public init(dataManager: RemoveEmployeeDataContract) {
        self.dataManager = dataManager
    }

    override public func run(request: RemoveEmployeeRequest, success: @escaping (RemoveEmployeeResponse) -> Void, failure: @escaping (RemoveEmployeeError) -> Void) {
        dataManager.removeEmployee(employeeId: request.employeeId, userId: request.userId, success: { [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: { [weak self] error in
            self?.failure(error: RemoveEmployeeError(error: error), callback: failure)
        })
    }

    private func success(message: String, callback: @escaping (RemoveEmployeeResponse) -> Void) {
        let response = RemoveEmployeeResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: RemoveEmployeeError, callback: @escaping (RemoveEmployeeError) -> Void) {
        invokeFailure(callback: callback, failure: error)
    }
}

