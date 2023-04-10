//
//  UserLoginView.swift
//  NCNUI
//
//  Created by raja-16327 on 13/03/23.
//

import AppKit
import Foundation
import NCN_BackEnd
class UserLoginView: NSView {
    var userName: String
    var password: String
    var presenter: UserLoginPresenter

    init(userName: String, password: String, presenter: UserLoginPresenter) {
        self.userName = userName
        self.password = password
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(userName: userName, password: password)
        }
    }
}

extension UserLoginView: UserLoginViewContract {
    func load(message: String) {
        print(message)
    }
}
