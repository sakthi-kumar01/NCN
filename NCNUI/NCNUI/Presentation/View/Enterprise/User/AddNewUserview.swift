//
//  AddNewUserview.swift
//  NCNUI
//
//  Created by raja-16327 on 24/03/23.
//

import AppKit
import Foundation
public class AddNewUserView: NSView {
    var presenter: AddNewUserPresenterContract

    init(presenter: AddNewUserPresenterContract) {
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded()
        }
    }
}

extension AddNewUserView: AddNewUserViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
