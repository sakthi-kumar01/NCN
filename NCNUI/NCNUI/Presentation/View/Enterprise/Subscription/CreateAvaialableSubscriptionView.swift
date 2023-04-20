//
//  CreateAvaialableSubscriptionView.swift
//  NCNUI
//
//  Created by raja-16327 on 27/03/23.
//

import AppKit
import Foundation
public class CreateAvailableSubscriptionView: NSView {
    var subscriptionId: Int
    var subscriptionPackageType: String
    var subscriptionCountLimit: Float
    var subscritptionDayLimit: Int
    var serviceId: Int

    var presenter: CreateAvailableSubscriptionPresenter

    init(subscriptionId: Int, subscriptionPackageType: String, subscriptionCountLimit: Float, subscritptionDayLimit: Int, serviceId: Int, presenter: CreateAvailableSubscriptionPresenter) {
        self.subscriptionId = subscriptionId
        self.subscriptionPackageType = subscriptionPackageType
        self.subscriptionCountLimit = subscriptionCountLimit
        self.subscritptionDayLimit = subscritptionDayLimit
        self.serviceId = serviceId
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(subscriptionId: subscriptionId, subscriptionPackageType: subscriptionPackageType, subscriptionConuntLimit: subscriptionCountLimit, subscriptionDaylimit: subscritptionDayLimit, serviceId: serviceId)
        }
    }
}

extension CreateAvailableSubscriptionView: CreateAvailableSubscriptionViewContract {
    func load(response: String) {
        print(message)
    }

    func failed(error: String) {
        print(error)
    }
}
