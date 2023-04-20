//
//  ClientTrackServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
public protocol ClientTrackServiceViewContract: AnyObject {
    func load(message: String)
}

public protocol ClientTrackServicePresenterContract {
    func viewLoaded(id: Int, subscriptionUsage: Int, userId: Int)
}

public protocol ClientTrackServiceRouterContract: AnyObject {
    func selected(message: String)
}
