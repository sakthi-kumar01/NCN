//
//  Data_Base.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 03/04/23.
//

import Foundation
import SQLite3
public class DataBase {
    var db: OpaquePointer?

    public init() {}

    func openDatabase(databaseName: String) {
        var filePath = ""

        do {
            var path = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            path.append(path: "\(databaseName).sqlite")

            filePath = path.absoluteString

        } catch {
            print("Error creating database!")
        }
        var tempDbPointer: OpaquePointer?

        if sqlite3_open(filePath, &tempDbPointer) == SQLITE_OK {
            if let dbPointer = tempDbPointer {
                db = dbPointer
            }
        } else {
            print("Error in Database Creation")
        }
    }

    func prepareCreateTableStatement(tableName: String, columns: [String: String], foreignKeyConstraints: [String]) -> String {
        let columnsString = columns.map { "\($0) \($1)" }.joined(separator: ", ")
        var createTableStatement = "CREATE TABLE IF NOT EXISTS \(tableName) (\(columnsString));"
        for foreignKeys in foreignKeyConstraints {
            createTableStatement = createTableStatement + foreignKeys
        }
        return createTableStatement
    }

    func createTable(tableName: String, columns: [String: String], foreignKeyConstrsint: [String]) {
        let createTableStatement = prepareCreateTableStatement(tableName: tableName, columns: columns, foreignKeyConstraints: foreignKeyConstrsint)

        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTableStatement, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Table created successfully")
            } else {
                print("Failed to create table: \(String(cString: sqlite3_errmsg(db)))")
            }
        } else {
            print("Failed to prepare create table statement: \(String(cString: sqlite3_errmsg(db)))")
        }
        sqlite3_finalize(statement)
    }

    func prepareInsertStatement(tableName: String, columns: [String], values: [String]) -> String {
        let columnsString = columns.joined(separator: ", ")
        let valuesString = values.map { _ in "?" }.joined(separator: ", ")
        let insertStatement = "INSERT INTO \(tableName) (\(columnsString)) VALUES (\(valuesString));"
        print(insertStatement)
        return insertStatement
    }

    func insertData(db: OpaquePointer, tableName: String, columns: [String], values: [String]) {
        let insertStatement = prepareInsertStatement(tableName: tableName, columns: columns, values: values)

        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, insertStatement, -1, &statement, nil) == SQLITE_OK {
            for (index, value) in values.enumerated() {
                sqlite3_bind_text(statement, Int32(index + 1), value.cString(using: .utf8), -1, nil)
                print(value.cString(using: .utf8)!)
            }

            if sqlite3_step(statement) == SQLITE_DONE {
                print("Data inserted successfully")
            } else {
                print("Failed to insert data: \(String(cString: sqlite3_errmsg(db)))")
            }
        } else {
            print("Failed to prepare insert statement: \(String(cString: sqlite3_errmsg(db)))")
        }
        sqlite3_finalize(statement)
    }

    func enableForeignKeys(_ db: OpaquePointer) {
        var statement: OpaquePointer?

        let query = "PRAGMA foreign_keys = ON;"
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) != SQLITE_OK {
            print("Error preparing foreign key enforcement")
            return
        }

        if sqlite3_step(statement) != SQLITE_DONE {
            print("Error enabling foreign key enforcement")
        }

        sqlite3_finalize(statement)
    }

    func updateData() {}

    func deleteData() {}
}

extension DataBase {
    func createTables() {
        createUserTable()
        createEmployeeTypeTable()
        createEmployeeTable()
        createAdminTable()
        createAvailableSubscriptionTable()
        createAvailableservicesTable()
        createQueryTypeTable()
        createQueryTable()
        createServiceLinkTableTable()
    }

    // 1
    func createUserTable() {
        let tableName = "users"
        let columns: [String: String] = [
            "userId": "INTEGER NOT NULL UNIQUE",
            "userName": "TEXT NOT NULL",
            "eMail": "TEXT NOT NULL",
            "password": "TEXT NOT NULL",
            "mobileNumber": "INTEGER NOT NULL",

            "PRIMARY KEY": "(\"userId\" AUTOINCREMENT)",
        ]
        let foreignKeyConstraints: [String] = []

        createTable(tableName: tableName, columns: columns, foreignKeyConstrsint: foreignKeyConstraints)
    }

    // 2
    func createEmployeeTypeTable() {
        let tableName = "employeeType"
        let columns: [String: String] = [
            "\"employeeTypeId\"": "INTEGER NOT NULL UNIQUE",
            "\"employeeType\"": "TEXT",
            "PRIMARY KEY": "(\"employeeTypeId\" AUTOINCREMENT)",
        ]
        let foreignKeyConstraints: [String] = []

        createTable(tableName: tableName, columns: columns, foreignKeyConstrsint: foreignKeyConstraints)
    }

    // 3
    func createEmployeeTable() {
        let tableName = "employee"

        let columns = [
            "\"employeeId\"": "INTEGER NOT NULL UNIQUE",
            "\"employeeTypeId\"": "INTEGER",
            "\"userId\"": "INTEGER",
        ]

        let foreignKeyConstraints = [
            ", PRIMARY KEY(\"employeeId\" AUTOINCREMENT)",
            ", FOREIGN KEY(\"employeeTypeId\") REFERENCES \"employeeType\"(\"employeeTypeId\")",
            ", FOREIGN KEY(\"userId\") REFERENCES \"Users\"(\"userId\")",
        ]

        createTable(tableName: tableName, columns: columns, foreignKeyConstrsint: foreignKeyConstraints)
    }

    // 4
    func createAdminTable() {
        let tableName = "admin"
        let columns: [String: String] = [
            "userId": "INTEGER",
            "employeeId": "INTEGER",
        ]
        let foreignKeyConstraints = [
            ", FOREIGN KEY(\"userId\") REFERENCES \"Users\"(\"userId\")",
            ", FOREIGN KEY(\"employeeId\") REFERENCES \"employee\"(\"employeeId\")",
        ]

        let createTableStatement = prepareCreateTableStatement(tableName: tableName, columns: columns, foreignKeyConstraints: foreignKeyConstraints)
        print(createTableStatement)
    }

    // 5
    func createAvailableSubscriptionTable() {
        let tableName = "availableSubscription"
        let columns: [String: String] = [
            "\"subscriptionId\"": "INTEGER NOT NULL UNIQUE",
            "\"subscriptionPackageType\"": "TEXT NOT NULL",
            "\"subscriptionCountLimit\"": "NUMERIC NOT NULL",
            "\"subscritptionDayLimit\"": "NUMERIC NOT NULL",
            "\"serviceId\"": "INTEGER NOT NULL",
        ]
        let foreignKeyConstraints = [
            ", PRIMARY KEY(\"subscriptionId\" AUTOINCREMENT)",
            ", FOREIGN KEY(\"serviceId\") REFERENCES \"availableService\"(\"serviceId\")",
        ]

        createTable(tableName: tableName, columns: columns, foreignKeyConstrsint: foreignKeyConstraints)
    }

    // 6
    func createAvailableservicesTable() {
        let tableName = "availableService"
        let columns = [
            "serviceId": "INTEGER NOT NULL UNIQUE",
            "serviceTitle": "TEXT",
            "serviceDescription": "TEXT",
        ]
        let foreignKeyConstraints = [
            ", PRIMARY KEY(\"serviceId\" AUTOINCREMENT)",
        ]

        createTable(tableName: tableName, columns: columns, foreignKeyConstrsint: foreignKeyConstraints)
    }

    // 7
    func createQueryTypeTable() {
        let tableName = "\"queryType\""
        let columns: [String: String] = [
            "\"queryTypeId\"": "INTEGER NOT NULL UNIQUE",
            "\"qeryType\"": "TEXT NOT NULL",
            "PRIMARY KEY": "(\"queryTypeId\" AUTOINCREMENT)",
        ]
        let foreignKeyConstraints: [String] = []

        createTable(tableName: tableName, columns: columns, foreignKeyConstrsint: foreignKeyConstraints)
    }

    // 8
    func createQueryTable() {
        let tableName = "query"

        let columns: [String: String] = [
            "queryId": "INTEGER NOT NULL UNIQUE",
            "queryTypeId": "INTEGER NOT NULL",
            "queryMessage": "TEXT NOT NULL",
            "queryStatus": "TEXT",
            "createdOn": "DATE NOT NULL",
            "userId": "INTEGER NOT NULL",
            "employeeId": "INTEGER",

            "PRIMARY KEY": "(\"queryId\" AUTOINCREMENT)",
        ]

        let foreignKeyConstraints = [
            ", FOREIGN KEY(\"employeeId\") REFERENCES \"employee\"(\"employeeId\")",

            ", FOREIGN KEY(\"userId\") REFERENCES \"users\"(\"userId\")",
            ", FOREIGN KEY(\"queryTypeId\") REFERENCES \"queryType\"(\"queryTypeId\")",
        ]

        createTable(tableName: tableName, columns: columns, foreignKeyConstrsint: foreignKeyConstraints)
    }

    // 9
    func createServiceLinkTableTable() {
        let tableName = "serviceLinkTable"

        let columns: [String: String] = [
            "id": "INTEGER NOT NULL UNIQUE",
            "userId": "INTEGER NOT NULL",
            "employeeId": "INTEGER NOT NULL",
            "serviceId": "INTEGER NOT NULL",
            "subscriptionId": "INTEGER NOT NULL",
        ]

        let foreignKeyConstraints = [
            "FOREIGN KEY(\"employeeId\") REFERENCES \"employee\"(\"employeeId\"),",
            "FOREIGN KEY(\"serviceId\") REFERENCES \"availableService\"(\"serviceId\"),",
            "FOREIGN KEY(\"subscriptionId\") REFERENCES \"availableSubscription\"(\"subscriptionId\"),",
            "FOREIGN KEY(\"userId\") REFERENCES \"users\"(\"userId\"),",
            "PRIMARY KEY(\"id\" AUTOINCREMENT),",
        ]

        createTable(tableName: tableName, columns: columns, foreignKeyConstrsint: foreignKeyConstraints)
    }
}
