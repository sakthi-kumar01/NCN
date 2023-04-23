//
//  RemoveAvailableServiceView.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import AppKit
import Foundation
class RemoveAvailableServiceView: NSView {
    public var serviceId: Int

    var presenter: RemoveAvailableServicePresenter

    init(serviceId: Int, presenter: RemoveAvailableServicePresenter) {
        self.serviceId = serviceId

        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(serviceId: serviceId)
        }
    }
}

extension RemoveAvailableServiceView: RemoveAvailableServiceViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
