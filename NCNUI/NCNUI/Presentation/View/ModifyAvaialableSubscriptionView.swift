//
//  ModifyAvaialableSubscriptionView.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import AppKit
import Foundation

class ModifyAvailableSubscriptionView: NSView {
    public var subscriptionId: Int
    public var subscriptionPackageType: String
    public var subscriptionCountLimit: Float
    public var subscriptionDayLimit: Int

    var presenter: ModifyAvailableSubscriptionPresenter

    init(subscriptionId: Int, subscriptionPackageType: String, subscriptionCountLimit: Float, subscriptionDayLimit: Int, presenter: ModifyAvailableSubscriptionPresenter) {
        self.subscriptionId = subscriptionId
        self.subscriptionPackageType = subscriptionPackageType
        self.subscriptionCountLimit = subscriptionCountLimit
        self.subscriptionDayLimit = subscriptionDayLimit
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(subscriptionId: subscriptionId, subscriptionPackageType: subscriptionPackageType, subscriptionCountLimit: subscriptionCountLimit, subscriptionDayLimit: subscriptionDayLimit)
        }
    }
}

extension ModifyAvailableSubscriptionView: ModifyAvailableSubscriptionViewContract {
    func load(message: String) {
        print(message)
    }

    func failed(error: String) {
        print(error)
    }
}
