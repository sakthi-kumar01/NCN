//
//  TrackServiceClientView.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import AppKit
import Foundation
import NCN_BackEnd
class TrackClientServiceView: NSView {
    public var userId: Int

    var presenter: TrackClientServicePresenter

    init(userId: Int, presenter: TrackClientServicePresenter) {
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

extension TrackClientServiceView: TrackClientServiceViewContract {
    func load(message: String) {
        print(message)
    }

    func failed(error: String) {
        print(error)
    }
}
