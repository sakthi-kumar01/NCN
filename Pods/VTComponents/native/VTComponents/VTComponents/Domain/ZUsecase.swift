//
//  ZUsecase.swift
//  ZohoMail
//
//  Created by Rahul T on 24/07/17.
//  Copyright © 2017 Zoho Corporation. All rights reserved.
//

//
//  ZUsecase.swift
//  ZohoMail
//
//  Created by Rahul T on 24/07/17.
//  Copyright © 2017 Zoho Corporation. All rights reserved.
//

import Foundation

// Request to have without zuid
open class Request {
    public var qos: DispatchQoS.QoSClass = .utility // Quality of Service

    public init() {}
}

open class Response {
    enum Status {
        case success
        case networkUnavailable
        case timeout
        case authenticationFailure
        case dataNotFound
        case parsingFailed
        case unknownError
    }

    var status: Status

    public init() {
        status = .success
    }
}

public enum ZRequestType: Int {
    case database
    case network
    case both
}

open class ZRequest: Request {
    public var zuid: String

    public init(zuid: String) {
        self.zuid = zuid
    }
}

open class ZResponse: Response {
    override public init() {}
}

open class ZError {
    public enum Status {
        case networkUnavailable
        case timeout
        case authenticationFailure
        case unknownError
        case irresponsiveDatabase
        case wrongValue
    }

    var status: Status

    public init(status: Status) {
        self.status = status
    }
}

public enum ZErrorType: Error {
    case networkUnavailable
    case timeout
    case authenticationFailure
    case dataNotFound
    case parsingFailed
    case unknownError
    case serverFailure
    case networkIPLock
    case invalidRequestError
    case retryableNetworkError
}

open class ZActivityMetaData {
    // metadata for activity tracker
    public var groupId: String?
    public var groupActionName: String?
    public var moduleName: String?

    public var isUserInitiated: Bool?
    public var apiName: String?

    public init(groupId: String?, groupActionName: String?, moduleName: String?) {
        self.groupId = groupId
        self.groupActionName = groupActionName
        self.moduleName = moduleName
    }
}

public enum UsecaseQueue {
    public static let queue: DispatchQueue = .init(label: Bundle.main.bundleIdentifier!, attributes: .concurrent)
}

open class ZUsecase<CustomRequest: Request, CustomResponse: Response, CustomError: ZError>: NSObject {
    public final func execute(request: CustomRequest, onSuccess success: @escaping (_ response: CustomResponse) -> Void = { _ in }, onFailure failure: @escaping (_ error: CustomError) -> Void = { _ in }) {
        UsecaseQueue.queue.async { [weak self] in
            self?.run(request: request, success: success, failure: failure)
        }
    }

    open func run(request _: CustomRequest, success _: @escaping (_ response: CustomResponse) -> Void, failure _: @escaping (_ error: CustomError) -> Void) {}

    public final func invokeSuccess(callback: @escaping (_ response: CustomResponse) -> Void, response: CustomResponse) {
        if Thread.isMainThread {
            callback(response)
        } else {
            DispatchQueue.main.async {
                callback(response)
            }
        }
    }

    public final func invokeFailure(callback: @escaping (_ failure: CustomError) -> Void, failure: CustomError) {
        if Thread.isMainThread {
            callback(failure)
        } else {
            DispatchQueue.main.async {
                callback(failure)
            }
        }
    }

    deinit {}
}
