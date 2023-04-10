//
//  EmployeeViewQueryView.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import AppKit
class EmployeeViewQueryView: NSView {
    
    public var employeeId: Int
    
    var presenter: EmployeeViewQueryPresenter
    
    init(  employeeId: Int, presenter: EmployeeViewQueryPresenter) {
        
        self.employeeId = employeeId
        
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded(employeeId: employeeId )
        }
    }
}

extension EmployeeViewQueryView: EmployeeViewQueryViewContract {
    func load(message: String) {
        print(message)
    }
    
    func failed(error: String) {
        print(error)
    }
}
