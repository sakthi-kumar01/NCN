//
//  AddNewEmployeeView.swift
//  NCNUI
//
//  Created by raja-16327 on 24/03/23.
//

import AppKit
import Foundation
import NCN_BackEnd

public class AddNewEmployeeView: NSView {
    var presenter: AddNewEmployeePresenterContract

    init(presenter: AddNewEmployeePresenterContract) {
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

extension AddNewEmployeeView: AddNewEmployeeViewContract {
    func load(message: String) {
        print(message)
    }

    func failed(error: String) {
        print(error)
    }
}
