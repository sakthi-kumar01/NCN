//
//  CreateAvailableServiceView.swift
//  NCNUI
//
//  Created by raja-16327 on 21/03/23.
//

import AppKit
import Foundation
import NCN_BackEnd

class CreateAvailableServiceView: NSView {
    var serviceId: Int
    var serviceTitle: String
    var serviceDescription: String
    var presenter: CreateAvailableServicesPresenter

    init(serviceId: Int, serviceTitle: String, serviceDescription: String, presenter: CreateAvailableServicesPresenter) {
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

extension CreateAvailableServiceView: CreateAvailableServiceViewContract {
    func load(serviceId: Int, serviceTitle: String, serviceDescription: String) {
        print("service Id: \(serviceId)")
        print("service Title: \(serviceTitle)")
        print("service Description: \(serviceDescription)")
    }

    func failed(error: String) {
        print(error)
    }
}
