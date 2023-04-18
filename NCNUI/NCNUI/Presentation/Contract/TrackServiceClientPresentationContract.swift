//
//  TrackServiceClientPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
public protocol TrackClientServiceViewContract: AnyObject {
    func load(message: String)
}

public protocol TrackClientServicePresenterContract {
    func viewLoaded(id: Int, subscriptionUsage: Int, userId: Int)
}

public protocol TrackClientServiceRouterContract: AnyObject {
    func selected(message: String)
}
