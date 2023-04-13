//
//  Router.swift
//  NCNUI
//
//  Created by raja-16327 on 13/03/23.
//

import AppKit
import Foundation
class Router {
    var window: NSWindow

    weak var userLoginView: UserLoginView?

    init(window: NSWindow) {
        self.window = window
    }

    func launch() {
        // for success case
        window.contentView = Assembler.getRemoveServiceView(serviceId: 4)
    }
}

extension Router: UserLoginRouterContract, CreateAvailableServiceRouterContract, ViewServiceRouterContract, AddNewUserRouterContract, AddNewEmployeeRouterContract, CreateAvailableSubscriptionRouterContract, ViewSubscriptionRouterContract, CreateQueryRouterContract, BuyServiceRouterContract {
    func selected(message: String) {
        print(message)
    }
}
