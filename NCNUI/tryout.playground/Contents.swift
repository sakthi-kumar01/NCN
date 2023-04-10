import Cocoa

let columnName: [String] = ["Admin", "Freelancer", "Permanent", "Contract", "Trainee"]
var columnNameString = ""
// for names in columnName {
//    columnNameString = columnNameString + names + "," + " "
//
// }
//
// var ans =  columnNameString.dropLast(2)

columnNameString = columnName.joined(separator: ", ")
