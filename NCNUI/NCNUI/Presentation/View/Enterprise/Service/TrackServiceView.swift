//
//  TrackServiceView.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import AppKit
import Foundation
import NCN_BackEnd

public class TrackServiceView: NSView {
    public var id: Int
    public var subscriptionUsage: Int
    public var employeeId: Int

    var presenter: TrackServicePresenter

    public init(id:Int, subscriptionUsage: Int, employeeId: Int, presenter: TrackServicePresenter) {
        self.id = id
        self.subscriptionUsage = subscriptionUsage
        self.employeeId = employeeId

        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(id: id, subscriptionUsage: subscriptionUsage,employeeId: employeeId)
        }
    }
}

extension TrackServiceView: TrackServiceViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
