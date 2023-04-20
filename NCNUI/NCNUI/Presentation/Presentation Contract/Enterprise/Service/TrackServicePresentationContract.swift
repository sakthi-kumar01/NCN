//
//  TrackServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
protocol TrackServiceViewContract: AnyObject {
    func load(response: String)
}

protocol TrackServicePresenterContract {
    func viewLoaded(id: Int, subscriptionUsage: Int, employeeId: Int)
}

protocol TrackServiceRouterContract: AnyObject {
    func selected(response: String)
}
