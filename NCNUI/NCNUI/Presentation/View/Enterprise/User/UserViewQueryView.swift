//
//  ViewUserQueryView.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import AppKit
import Foundation

class ViewUserQueryView: NSView {
    public var userId: Int

    var presenter: ViewUserQueryPresenter

    init(userId: Int, presenter: ViewUserQueryPresenter) {
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
            presenter.viewLoaded(userId: userId)
        }
    }
}

extension ViewUserQueryView: ViewUserQueryViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
