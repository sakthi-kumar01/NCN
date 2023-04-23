//
//  ClientTrackServiceView.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import AppKit
import Foundation
import NCN_BackEnd
public class ClientTrackServiceView: NSView {
    public var userId: Int
    public var id: Int
    public var subscriptionUsage: Int
    var presenter: ClientTrackServicePresenter

    public init(id: Int, subscriptionUsage: Int, userId: Int, presenter: ClientTrackServicePresenter) {
        self.id = id
        self.subscriptionUsage = subscriptionUsage
        self.userId = userId
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(id: id, subscriptionUsage: subscriptionUsage, userId: userId)
        }
    }
}

extension ClientTrackServiceView: ClientTrackServiceViewContract {
    public func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
