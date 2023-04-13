//
//  ViewSubscriptionView.swift
//  NCNUI
//
//  Created by raja-16327 on 27/03/23.
//

import AppKit
import Foundation
public class ViewSubscriptionView: NSView {
    var presenter: ViewSubscriptionPresenter

    init(presenter: ViewSubscriptionPresenter) {
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded()
        }
    }
}

extension ViewSubscriptionView: ViewSubscriptionViewContract {
    func load(subscriptionId: Int, subscriptionPackageType: String?, subscriptionCountLimit: Int?, subscritptionDayLimit: Int?, serviceId: Int) {
        print("=================================================")
        print(subscriptionId)
        print(subscriptionPackageType)
        print(subscriptionCountLimit)
        print(subscritptionDayLimit)
        print(serviceId)
        print("==================================================")
    }

    func failed(error: String) {
        print(error)
    }
}
