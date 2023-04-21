//
//  CreateQuery.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 28/03/23.
//

import Foundation
import VTComponents

public final class CreateQueryRequest: Request {
    public var queryId: Int
    public var queryType: QueryType
    public var queryMessage: String
    public var queryDate: Date
    public var userId: Int
    public var employeeId: Int
    public var enterpriseId: Int
    public init(queryId: Int, queryType: QueryType, queryMessage: String, queryDate: Date, enterpriseId: Int, userId: Int, employeeId: Int) {
        self.queryId = queryId
        self.queryType = queryType
        self.queryMessage = queryMessage
        self.queryDate = queryDate
        self.enterpriseId = enterpriseId
        self.employeeId = employeeId
        self.userId = userId
    }
}

public final class CreateQueryResponse: ZResponse {
    public var response: String
    public init(response: String) {
        self.response = response
    }
}

public final class CreateQueryError: ZError {
    public var error: String
    public init(error: String) {
        self.error = error
        super.init(status: .networkUnavailable)
    }
}

public final class CreateQuery: ZUsecase<CreateQueryRequest, CreateQueryResponse, CreateQueryError> {
    public var datamanger: CreateQueryDataContract

    public init(datamanger: CreateQueryDataContract) {
        self.datamanger = datamanger
    }

    override public func run(request: CreateQueryRequest, success: @escaping (CreateQueryResponse) -> Void, failure: @escaping (CreateQueryError) -> Void) {
        datamanger.createQuery(queryId: request.queryId, queryType: request.queryType, queryMessage: request.queryMessage, queryDate: request.queryDate, userId: request.userId, employeeId: request.employeeId, enterpriseId: request.enterpriseId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }

    private func success(response: String, callback: @escaping (CreateQueryResponse) -> Void) {
        let response = CreateQueryResponse(response: response)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(response: String, callback: @escaping (CreateQueryError) -> Void) {
        let error = CreateQueryError(error: response)
        invokeFailure(callback: callback, failure: error)
    }
}
