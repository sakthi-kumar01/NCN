//
//  ViewAdminClientView.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import AppKit
import Foundation
import NCN_BackEnd
class ViewAdminClientView: NSView {
    public var employeeId: Int

    var presenter: ViewAdminClientPresenter

    init(employeeId: Int, presenter: ViewAdminClientPresenter) {
        self.employeeId = employeeId

        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(employeeId: employeeId)
        }
    }
}

extension ViewAdminClientView: ViewAdminClientViewContract {
    func load(message: String) {
        print(message)
    }

    func failed(error: String) {
        print(error)
    }
}
