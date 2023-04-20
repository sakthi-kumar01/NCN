//
//  AssignQueryView.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import AppKit
import Foundation
import NCN_BackEnd

class AssignQueryView: NSView {
    public var employeeId: Int
    public var queryId: Int

    var presenter: AssignQueryPresenter

    init(employeeId: Int, queryId: Int, presenter: AssignQueryPresenter) {
        self.employeeId = employeeId
        self.queryId = queryId
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(employeeId: employeeId, queryId: queryId)
        }
    }
}

extension AssignQueryView: AssignQueryViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
