//
//  RemoveSubscriptionView.swift
//  NCNUI
//
//  Created by raja-16327 on 12/04/23.
//

import Foundation
import AppKit


class RemoveSubscriptionView: NSView {
    
    public var subscriptionId: Int
    
    var presenter: RemoveSubscriptionPresenter
    
    init(  subscriptionId: Int, presenter: RemoveSubscriptionPresenter) {
        
        self.subscriptionId = subscriptionId
        
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(subscriptionId: subscriptionId )
        }
    }
}

extension RemoveSubscriptionView: RemoveSubscriptionViewContract {
    func load(message: String) {
        print(message)
    }
    
    func failed(error: String) {
        print(error)
    }
}
