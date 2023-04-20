//
//  ViewEmployeeQueryView.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import AppKit
class ViewEmployeeQueryView: NSView {
    
    public var employeeId: Int
    
    var presenter: ViewEmployeeQueryPresenter
    
    init(  employeeId: Int, presenter: ViewEmployeeQueryPresenter) {
        
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

extension ViewEmployeeQueryView: ViewEmployeeQueryViewContract {
    func load(response: String) {
        print(response)
    }
    
    func failed(error: String) {
        print(error)
    }
}
