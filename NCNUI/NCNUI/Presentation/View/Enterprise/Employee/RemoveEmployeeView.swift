//
//  RemoveEmployeeView.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import AppKit
import Foundation

class RemoveEmployeeView: NSView {
    public var employeeId: Int
    public var userId: Int

    var presenter: RemoveEmployeePresenter

    init(employeeId: Int, userId: Int, presenter: RemoveEmployeePresenter) {
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
            presenter.viewLoaded(employeeId: employeeId, userId: userId)
        }
    }
}

extension RemoveEmployeeView: RemoveEmployeeViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
