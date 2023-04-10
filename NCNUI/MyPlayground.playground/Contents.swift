import Cocoa

var greeting = "Hello, playground"
func selectQuery(whereBool: Bool, neededColumn: [String], columnName: [String], columnValue: [Any], tablename: String) -> String {
    var stringone = "SELECT "
    var stringTwo = ""
    let fromClause = "FROM "

    if whereBool {
        if neededColumn.count == 0 {
            stringone = stringone + "* "
            stringone = stringone + fromClause
            stringone = stringone + tablename + " "
            if columnName.count != 0 { stringone = stringone + "WHERE" + buildWhere(columnName: columnName, columnValue: columnValue) }
        } else {
            stringone = stringone + buildNeedColumns(needColumn: neededColumn) + " "
            stringone = stringone + fromClause
            stringone = stringone + tablename + " "
            if columnName.count != 0 { stringone = stringone + "WHERE" + buildWhere(columnName: columnName, columnValue: columnValue) }
        }

    } else {
        if columnName.count == 0 {
            stringone = stringone + "* "
        }
    }
    stringone = stringone + stringTwo
    return stringone
}

func buildNeedColumns(needColumn: [String]) -> String {
    var stringOne = ""
    for names in needColumn {
        stringOne = stringOne + names
        stringOne = stringOne + ", "
    }
    stringOne = String(stringOne.dropLast(2))
    print(stringOne)
    return stringOne
}

func buildWhere(columnName: [String], columnValue: [Any]) -> String {
    var stringOne = " "
    for i in 0 ..< columnName.count {
        stringOne = stringOne + columnName[i] + " "
        stringOne = stringOne + "= "
        if columnValue[i] is Int || columnValue[i] is Float {
            stringOne = stringOne + "\(columnValue[i] as! Int)"
        } else if columnValue[i] is String {
            let value: String = columnValue[i] as! String
            stringOne = stringOne + "\'" + value + "\'"
        }
        if i + 1 != columnName.count { stringOne = stringOne + " AND " }
    }
    return stringOne
}

var columnName: [String] = ["userName", "password", "userId"]
var columnValue: [Any] = ["raja", "rajas", 1]
var neededColumn: [String] = ["userName", "password"]
let output = selectQuery(whereBool: true, neededColumn: neededColumn, columnName: columnName, columnValue: columnValue, tablename: "users")
print(output)
buildWhere(columnName: columnName, columnValue: columnValue)
