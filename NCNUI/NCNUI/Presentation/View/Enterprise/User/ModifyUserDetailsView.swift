//
//  ModifyUserDetailsView.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import AppKit
import Foundation

class ModifyUserDetailsView: NSView {
    public var userId: Int, userName: String, password: String, eMail: String, mobileNo: Int

    var presenter: ModifyUserDetailsPresenter

    init(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int, presenter: ModifyUserDetailsPresenter) {
        self.userId = userId
        self.userName = userName
        self.password = password
        self.eMail = eMail
        self.mobileNo = mobileNo

        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(userId: userId, userName: userName, password: password, eMail: eMail, mobileNo: mobileNo)
        }
    }
}

extension ModifyUserDetailsView: ModifyUserDetailsViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
