//
//  BuyServiceView.swift
//  NCNUI
//
//  Created by raja-16327 on 29/03/23.
//

import AppKit
import Foundation
import NCN_BackEnd
class BuyServiceView: NSView {
    public var userId: Int
    public var employeeId: Int
    public var serviceId: Int
    public var subscriptionId: Int
    public var enterpriseId: Int
    var presenter: BuyServicePresenter

    init(enterpriseId: Int, userId: Int, employeeId: Int, serviceId: Int, subscriptionId: Int, presenter: BuyServicePresenter) {
        self.serviceId = serviceId
        self.subscriptionId = subscriptionId
        self.enterpriseId = enterpriseId
        self.employeeId = employeeId
        self.userId = userId
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(userId: userId, employeeId: employeeId, serviceId: serviceId, subscriptionId: subscriptionId, enterpriseId: enterpriseId)
        }
    }
}

extension BuyServiceView: BuyServiceViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
