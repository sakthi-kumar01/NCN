//
//  ModifyAvaialableServiceView.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import AppKit
import Foundation
class ModifyAvailableServiceView: NSView {
    public var serviceId: Int
    public var serviceTitle: String
    public var serviceDescription: String

    var presenter: ModifyAvailableServicePresenter

    init(serviceId: Int, serviceTitle: String, serviceDescription: String, presenter: ModifyAvailableServicePresenter) {
        self.serviceId = serviceId
        self.serviceTitle = serviceTitle
        self.serviceDescription = serviceDescription
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(serviceId: serviceId, serviceTitle: serviceTitle, serviceDescription: serviceDescription)
        }
    }
}

extension ModifyAvailableServiceView: ModifyAvailableServiceViewContract {
    func load(message: String) {
        print(message)
    }

    func failed(error: String) {
        print(error)
    }
}
