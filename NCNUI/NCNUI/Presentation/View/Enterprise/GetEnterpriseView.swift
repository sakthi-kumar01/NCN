//
//  GetEnterpriseView.swift
//  NCNUI
//
//  Created by raja-16327 on 20/04/23.
//

import AppKit
import Foundation
import NCN_BackEnd
class GetEnterpriseNameView: NSView {
    public var id: Int

    var presenter: GetEnterpriseNamePresenter

    init(id: Int, presenter: GetEnterpriseNamePresenter) {
        self.id = id

        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(id: id)
        }
    }
}

extension GetEnterpriseNameView: GetEnterpriseNameViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
