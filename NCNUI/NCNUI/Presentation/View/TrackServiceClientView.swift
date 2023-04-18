//
//  TrackServiceClientView.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import AppKit
import Foundation
import NCN_BackEnd
public class TrackClientServiceView: NSView {
    public var userId: Int
    public var id: Int
    public var subscriptionUsage: Int
    var presenter: TrackClientServicePresenter

    public init(id: Int, subscriptionUsage: Int, userId: Int, presenter: TrackClientServicePresenter) {
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

    public override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(id: id, subscriptionUsage: subscriptionUsage, userId: userId)
            
        }
    }
}

extension TrackClientServiceView: TrackClientServiceViewContract {
    public func load(message: String) {
        print(message)
    }

    func failed(error: String) {
        print(error)
    }
}
