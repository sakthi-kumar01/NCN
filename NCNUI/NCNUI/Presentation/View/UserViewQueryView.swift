//
//  ViewUserQueryView.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import AppKit

class ViewUserQueryView: NSView {
    
    public var userId: Int
    
    var presenter: ViewUserQueryPresenter
    
    init(  userId: Int, presenter: ViewUserQueryPresenter) {
        
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
            presenter.viewLoaded(userId: userId )
        }
    }
}

extension ViewUserQueryView: ViewUserQueryViewContract {
    func load(message: String) {
        print(message)
    }
    
    func failed(error: String) {
        print(error)
    }
}
