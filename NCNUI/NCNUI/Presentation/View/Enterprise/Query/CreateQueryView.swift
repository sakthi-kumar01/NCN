//
//  CreateQueryView.swift
//  NCNUI
//
//  Created by raja-16327 on 28/03/23.
//

import AppKit
import Foundation
import NCN_BackEnd
class CreateQueryView: NSView {
    public var queryId: Int
    public var queryType: QueryType
    public var queryMessage: String
    public var queryDate: Date
    public var userId: Int
    public var employeeId: Int
    public var enterpriseId: Int
    var presenter: CreateQueryPresenter

    init(queryId: Int, queryType: QueryType, queryMessage: String, queryDate: Date, enterpriseId: Int, userId: Int, employeeId: Int, presenter: CreateQueryPresenter) {
        self.queryId = queryId
        self.queryType = queryType
        self.queryMessage = queryMessage
        self.queryDate = queryDate
        self.enterpriseId = enterpriseId
        self.employeeId = employeeId
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
            presenter.viewLoaded(queryId: queryId, queryType: queryType, queryMessage: queryMessage, queryDate: queryDate, enterpriseId: enterpriseId, userId: userId, employeeId: employeeId)
        }
    }
}

extension CreateQueryView: CreateQueryViewContract {
    func load(response: String) {
        print(response)
    }

    func failed(error: String) {
        print(error)
    }
}
