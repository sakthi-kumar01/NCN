//
//  UserViewQueryView.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import AppKit

class UserViewQueryView: NSView {
    
    public var userId: Int
    
    var presenter: UserViewQueryPresenter
    
    init(  userId: Int, presenter: UserViewQueryPresenter) {
        
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

extension UserViewQueryView: UserViewQueryViewContract {
    func load(message: String) {
        print(message)
    }
    
    func failed(error: String) {
        print(error)
    }
}
