////
////  AdminViewClientDatamanger.swift
////  NCN BackEnd
////
////  Created by raja-16327 on 30/03/23.
////
//
// import Foundation
// public final class AdminViewClientDataManager {
//    public var dataBase: AdminViewClientDatabaseContract
//
//    public init(dataBase: AdminViewClientDatabaseContract) {
//        self.dataBase = dataBase
//    }
//
//    private func success(message: [User], callback: ([User]) -> Void) {
//        callback(message)
//    }
//
//    private func failure(message: String, callback: (String) -> Void) {
//        if message == "No Data" {
//            let error = "User doesn't exist"
//            callback(error)
//        }
//    }
// }
//
// extension AdminViewClientDataManager: AdminViewClientDataContract {
//    public func adminViewClient(employeeId: Int, success: @escaping ([User]) -> Void, failure: @escaping (String) -> Void) {
//        dataBase.adminViewClient(employeeId: employeeId, success: {
//            [weak self] message in
//            self?.success(message: message, callback: success)
//        },
//        failure: {
//            [weak self] message in
//
//            self?.failure(message: message, callback: failure)
//        })
//    }
// }
