//
//  ViewServiceView.swift
//  NCNUI
//
//  Created by raja-16327 on 23/03/23.
//

import AppKit
import Foundation
class ViewServiceView: NSView {
    var presenter: ViewServicePresenter

    init(presenter: ViewServicePresenter) {
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded()
        }
    }
}

extension ViewServiceView: ViewServiceViewContract {
    func load(serviceId: Int, serviceTitle: String, serviceDescription: String) {
        print("service Id: \(serviceId)")
        print("service Title: \(serviceTitle)")
        print("service Description: \(serviceDescription)")
    }

    func failed(error: String) {
        print(error)
    }
}
