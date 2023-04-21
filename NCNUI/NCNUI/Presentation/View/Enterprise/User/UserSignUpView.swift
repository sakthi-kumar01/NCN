//
//  UserSignUpView.swift
//  NCNUI
//
//  Created by raja-16327 on 20/04/23.
//

import Foundation
import AppKit
import NCN_BackEnd

class UserSignUpView: NSView {
    
    public var userName: String
public var password: String
    public var email: String
    public var mobileNumber: Int
    
    var presenter: UserSignUpPresenter
    
    init(  userName: String, password: String, email: String, mobileNumber: Int, presenter: UserSignUpPresenter) {
        
        self.userName = userName
        self.password = password
        self.email = email
        self.mobileNumber = mobileNumber
        
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(userName: userName, password: password, email: email, mobileNumber: mobileNumber )
        }
    }
}

extension UserSignUpView: UserSignUpViewContract {
    func load(response: String) {
        print(response)
    }
    
    func failed(error: String) {
        print(error)
    }
}
