//
//  TrackQueryView.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import AppKit
import Foundation

class TrackQueryView: NSView {
    public var employeeId: Int

    var presenter: TrackQueryPresenter

    init(employeeId: Int, presenter: TrackQueryPresenter) {
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

extension TrackQueryView: TrackQueryViewContract {
    func load(response: String) {
        print(message)
    }

    func failed(error: String) {
        print(error)
    }
}
