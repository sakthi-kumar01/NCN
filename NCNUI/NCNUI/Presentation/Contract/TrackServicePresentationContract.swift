//
//  TrackServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
protocol TrackServiceViewContract: AnyObject {
    func load(message: String)
}

protocol TrackServicePresenterContract {
    func viewLoaded(employeeId: Int)
}

protocol TrackServiceRouterContract: AnyObject {
    func selected(message: String)
}
