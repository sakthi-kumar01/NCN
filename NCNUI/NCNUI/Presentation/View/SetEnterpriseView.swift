//
//  SetEnterpriseView.swift
//  NCNUI
//
//  Created by raja-16327 on 13/04/23.
//

import AppKit
import Foundation
import NCN_BackEnd
class SetEnterpriseNameView: NSView {
    var enterpriseName: String
    var presenter: SetEnterpriseNamePresenter

    init(enterpriseName: String, presenter: SetEnterpriseNamePresenter) {
        self.enterpriseName = enterpriseName
        
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(enterpriseName: enterpriseName)
        }
    }
}

extension SetEnterpriseNameView: SetEnterpriseNameViewContract {
    func load(message: String) {
        print(message)
    }
}
