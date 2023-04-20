//
//  DeleteExpiredServiceView.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import AppKit



class DeleteExpiredServiceView: NSView {
    
   
    
    var presenter: DeleteExpiredServicePresenter
    
    init(presenter: DeleteExpiredServicePresenter) {
        
       
        
        self.presenter = presenter
        super.init(frame: NSZeroRect)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded( )
        }
    }
}

extension DeleteExpiredServiceView: DeleteExpiredServiceViewContract {
    func load(message: String) {
        print(message)
    }
    
    func failed(error: String) {
        print(error)
    }
}
