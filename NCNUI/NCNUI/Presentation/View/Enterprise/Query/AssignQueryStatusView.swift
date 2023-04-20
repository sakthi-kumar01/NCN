//
//  AssignQueryStatusView.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import AppKit
import Foundation
class AssignQueryStatusView: NSView {
    public var queryId: Int

    var presenter: AssignQueryStatusPresenter

    init(queryId: Int, presenter: AssignQueryStatusPresenter) {
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
            presenter.viewLoaded(queryId: queryId)
        }
    }
}

extension AssignQueryStatusView: AssignQueryStatusViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
