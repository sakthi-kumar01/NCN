//
//  ModifyEmployeeDetailsView.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
import AppKit

class ModifyEmployeeDetailsView: NSView {
    
    public var userId: Int
    public var userName: String
    public var password: String
    public var eMail: String
    public var mobileNo: Int
    
    var presenter: ModifyEmployeeDetailsPresenter
    
    init(  userId: Int, userName: String, password: String, eMail: String, mobileNo: Int, presenter: ModifyEmployeeDetailsPresenter) {
        
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
            presenter.viewLoaded(userId: userId, userName: userName, password: password, eMail: eMail, mobileNo: mobileNo )
        }
    }
}

extension ModifyEmployeeDetailsView: ModifyEmployeeDetailsViewContract {
    func load(response: String) {
        print(response)
    }
    
    func failed(error: String) {
        print(error)
    }
}

