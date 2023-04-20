//
//  AddNewEmployee.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 24/03/23.
//

import Foundation
import VTComponents
public final class AddNewEmployeeRequest: Request {
    public var userName: String
    public var password: String
    public var mobileNumber: Int64
    public var email: String
    public var employeeType: Int
    public var enterpriseId: Int
    public init(userName: String, password: String, email: String, mobileNumber: Int64, employeeType: Int, enterpriseId: Int) {
        self.userName = userName
        self.password = password
        self.email = email
        self.mobileNumber = mobileNumber
        self.employeeType = employeeType
        self.enterpriseId = enterpriseId
    }
}

public final class AddNewEmployeeResponse: Response {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class AddNewEmployeeError: ZError {
    public var error: String
    public init(error: String) {
        self.error = error
        super.init(status: .networkUnavailable)
    }
}

public final class AddNewEmployee: ZUsecase<AddNewEmployeeRequest, AddNewEmployeeResponse, AddNewEmployeeError> {
    public var datamanager: AddNewEmployeeDataContract

    public init(datamanger: AddNewEmployeeDataContract) {
        datamanager = datamanger
    }

    override public func run(request: AddNewEmployeeRequest, success: @escaping (AddNewEmployeeResponse) -> Void, failure: @escaping (AddNewEmployeeError) -> Void) {
        datamanager.addNewEmployee(userName: request.userName, password: request.password, email: request.email, mobileNumber: request.mobileNumber, employeeType: request.employeeType, enterpriseId: request.enterpriseId, success: ({
            [weak self] message in
            self?.success(response: message, callback: success)
        }), failure: {
            [weak self] message in
            self?.failure(error: message, callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (AddNewEmployeeResponse) -> Void) {
        let response = AddNewEmployeeResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: String, callback: @escaping (AddNewEmployeeError) -> Void) {
        let error = AddNewEmployeeError(error: error)
        invokeFailure(callback: callback, failure: error)
    }
}
