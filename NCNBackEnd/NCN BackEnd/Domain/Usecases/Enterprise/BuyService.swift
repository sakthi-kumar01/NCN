//
//  BuyService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 28/03/23.
//

import Foundation
import VTComponents
public final class BuyServiceRequest: Request {
    public var userId: Int
    public var employeeId: Int
    public var serviceId: Int
    public var subscriptionId: Int
    public var enterpriseId: Int
    public init(userId: Int, employeeId: Int, serviceId: Int, subscriptionId: Int, enterpriseId: Int) {
        self.userId = userId
        self.employeeId = employeeId
        self.serviceId = serviceId
        self.subscriptionId = subscriptionId
        self.enterpriseId = enterpriseId
    }
}

public final class BuyServiceResponse: Response {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class BuyServiceError: ZError {
    public var error: String
    public init(error: String) {
        self.error = error
        super.init(status: .networkUnavailable)
    }
}

public final class BuyService: ZUsecase<BuyServiceRequest, BuyServiceResponse, BuyServiceError> {
    var datamanager: BuyServiceDataContract
    public init(datamanager: BuyServiceDataContract) {
        self.datamanager = datamanager
    }

    override public func run(request: BuyServiceRequest, success: @escaping (BuyServiceResponse) -> Void, failure: @escaping (BuyServiceError) -> Void) {
        datamanager.buyService(userId: request.userId, employeeId: request.employeeId, serviceId: request.serviceId, subscriptionId: request.subscriptionId, enterpriseId: request.enterpriseId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(error: message, callback: failure)
        })
    }

    private func success(message: String, callback: @escaping (BuyServiceResponse) -> Void) {
        let response = BuyServiceResponse(response: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(error: String, callback: @escaping (BuyServiceError) -> Void) {
        let error = BuyServiceError(error: error)
        invokeFailure(callback: callback, failure: error)
    }
}
