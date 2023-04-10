//
//  DateExtension.swift
//  VTComponents-iOS
//
//  Created by Robin Rajasekaran on 30/01/20.
//

import Foundation

public extension Date {
    private static let allFlags: Set<Calendar.Component> = [.second, .minute, .hour, .day, .month, .year, .weekday, .weekOfYear, .weekdayOrdinal]
    private static let positiveSevenDayComponents: DateComponents = {
        var comps = DateComponents()
        comps.day = 7
        return comps
    }()

    private static let negativeSevenDayComponents: DateComponents = {
        var comps = DateComponents()
        comps.day = -7
        return comps
    }()

    static let oneHourTimeInterval: TimeInterval = 60 * 60
    static let oneDayTimeInterval: TimeInterval = oneHourTimeInterval * 24

    // MARK: - DAY

    var prevDay: Date {
        return prevDay(using: calendar)
    }

    var nextDay: Date {
        return nextDay(using: calendar)
    }

    func startOfDay(using calendar: Calendar) -> Date {
        return calendar.startOfDay(for: self)
    }

    func endOfDay(using calendar: Calendar) -> Date {
        var comps = calendar.dateComponents(Date.allFlags, from: self)
        comps.hour = 23
        comps.minute = 59
        comps.second = 59
        return calendar.date(from: comps)!
    }

    func prevDay(using calendar: Calendar) -> Date {
        return adding(days: -1, using: calendar)
    }

    func nextDay(using calendar: Calendar) -> Date {
        return adding(days: 1, using: calendar)
    }

    // MARK: - WEEK

    var startOfWeek: Date {
        return startOfWeek(using: calendar)
    }

    var endOfWeek: Date {
        return endOfWeek(using: calendar)
    }

    func startOfWeek(using calendar: Calendar) -> Date {
        if let date = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) {
            return date
        }

        print("VTComponents.Date.startOfWeek(using:) - this should not occur")
        return self
    }

    func endOfWeek(using calendar: Calendar) -> Date {
        return nextWeek(using: calendar).addingTimeInterval(-1)
    }

    func prevWeek(using calendar: Calendar) -> Date {
        return calendar.date(byAdding: Date.negativeSevenDayComponents, to: self)!
    }

    func nextWeek(using calendar: Calendar) -> Date {
        return calendar.date(byAdding: Date.positiveSevenDayComponents, to: self)!
    }

    // MARK: - MONTH

    var startOfMonth: Date {
        return startOfMonth(using: calendar)
    }

    var endOfMonth: Date {
        return nextMonth.prevDay
    }

    var nextMonth: Date {
        return nextMonth(using: calendar)
    }

    var sameDayInNextMonth: Date {
        return sameDayInNextMonth(using: calendar)
    }

    func startOfMonth(using calendar: Calendar) -> Date {
        var comps = calendar.dateComponents([.day, .month, .year], from: self) // Date.allFlags
        comps.day = 1
        return calendar.date(from: comps)!
    }

    func nextMonth(using calendar: Calendar) -> Date {
        var comps = calendar.dateComponents([.day, .month, .year], from: self)
        let month = comps.month! + 1
        comps.day = 1
        comps.month = month
        return calendar.date(from: comps)!
    }

    func sameDayInNextMonth(using calendar: Calendar) -> Date {
        var comps = calendar.dateComponents(Date.allFlags, from: self)
        let day = comps.day!
        let month = comps.month! + 1
        comps.day = 1
        comps.month = month
        let workingDate = calendar.date(from: comps)!
        let dayRange = calendar.range(of: .day, in: .month, for: workingDate)!
        comps.day = min(day, dayRange.upperBound - dayRange.lowerBound)
        return calendar.date(from: comps)!
    }

    // MARK: - YEAR

    var startOfYear: Date {
        return startOfYear(using: calendar)
    }

    var endOfYear: Date {
        return endOfYear(using: calendar)
    }

    func startOfYear(using calendar: Calendar) -> Date {
        var comps = calendar.dateComponents(Date.allFlags, from: self)
        comps.second = 0
        comps.minute = 0
        comps.hour = 0
        comps.day = 1
        comps.month = 1
        return calendar.date(from: comps)!
    }

    func endOfYear(using calendar: Calendar) -> Date {
        var comps = calendar.dateComponents(Date.allFlags, from: self)
        comps.second = 59
        comps.minute = 59
        comps.hour = 23
        comps.day = 31
        comps.month = 12
        return calendar.date(from: comps)!
    }

    func nextYear(using calendar: Calendar) -> Date {
        var comps = DateComponents()
        comps.year = 1
        return calendar.date(byAdding: comps, to: self)!
    }

    func prevYear(using calendar: Calendar) -> Date {
        var comps = DateComponents()
        comps.year = -1
        return calendar.date(byAdding: comps, to: self)!
    }

    // MARK: - Utilities

    var timeIntervalInMilliSec: TimeInterval {
        return (timeIntervalSince1970 * 1000)
    }

    // 1 = Sunday, 2 = Monday, etc.
    func weekDay(using calendar: Calendar) -> Int {
        return calendar.component(.weekday, from: self)
    }

    func monthDay(using calendar: Calendar) -> Int {
        return calendar.component(.day, from: self)
    }

    func weekdayOrdinal(using calendar: Calendar) -> Int {
        return calendar.component(.weekdayOrdinal, from: self)
    }

    func isWeekend(using calendar: Calendar) -> Bool {
        return calendar.isDateInWeekend(self)
    }

    func isYesterday() -> Bool {
        Calendar.current.isDateInYesterday(self)
    }

    func toNextNearest15Minutes(using calendar: Calendar) -> Date {
        let cal = calendar
        var comps = calendar.dateComponents(Date.allFlags, from: self)
        comps.minute = comps.minute! + (15 - (comps.minute! % 15))
        comps.second = 0
        return cal.date(from: comps)!
    }

    // MARK: - Static methods

    static func dateFromMilliseconds(value: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: value / 1000)
    }

    static func dateFromMilliseconds(value: String) -> Date {
        return dateFromMilliseconds(value: (value as NSString).doubleValue)
    }

    static func currentTimeInMilliseconds() -> UInt {
        return UInt(floor(Date().timeIntervalSince1970 * 1000))
    }

    // MARK: - Compare methods

    func isSameMinuteAs(_ date: Date) -> Bool {
        if isSameHourAs(date) {
            let calendar = Calendar.current
            let thisComps = calendar.dateComponents([.minute], from: self)
            let otherComps = calendar.dateComponents([.minute], from: date)
            return thisComps.minute! == otherComps.minute!
        }
        return false
    }

    func isSameHourAs(_ date: Date) -> Bool {
        if isSameDay(date) {
            let calendar = Calendar.current
            let thisComps = calendar.dateComponents([.hour], from: self)
            let otherComps = calendar.dateComponents([.hour], from: date)
            return thisComps.hour! == otherComps.hour!
        }
        return false
    }

    func isSameDay(_ date: Date) -> Bool {
        if isSameMonthAs(date) {
            let calendar = Calendar.current
            var compSet: Set<Calendar.Component> = .init()
            compSet.insert(Calendar.Component.day)
            let currentComps: DateComponents = calendar.dateComponents(compSet, from: self)
            let dateComps: DateComponents = calendar.dateComponents(compSet, from: date)
            return dateComps.day! == currentComps.day!
        }
        return false
    }

    /// This method only validates the same month date
    func isPreviousDayOf(_ date: Date) -> Bool {
        guard isSameMonthAs(date) else { return false }
        let calendar = Calendar.current
        var compSet = Set<Calendar.Component>()
        compSet.insert(Calendar.Component.day)
        let currentComps: DateComponents = calendar.dateComponents(compSet, from: self)
        let dateComps: DateComponents = calendar.dateComponents(compSet, from: date)
        return (dateComps.day! - 1) == currentComps.day!
    }

    /// This method only validates the same month date
    func isSameWeekAs(_ other: Date) -> Bool {
        if isSameMonthAs(other) {
            return isSameWeek(as: other)
        }
        return false
    }

    func isSameWeek(as date: Date, isSameMonth: Bool) -> Bool {
        if isSameMonth {
            return isSameWeekAs(date)
        }
        return isSameWeek(as: date)
    }

    private func isSameWeek(as date: Date) -> Bool {
        if let selfWeek = Calendar.current.dateComponents([.weekOfYear], from: self).weekOfYear,
           let otherWeek = Calendar.current.dateComponents([.weekOfYear], from: date).weekOfYear
        {
            return selfWeek == otherWeek
        }
        return false
    }

    /// This method only validates the same year date
    func isSameMonthAs(_ date: Date) -> Bool {
        if isSameYearAs(date) {
            return isSameMonth(as: date)
        }
        return false
    }

    func isSameMonth(as date: Date, isSameYear: Bool) -> Bool {
        if isSameYear {
            return isSameMonthAs(date)
        }
        return isSameMonth(as: date)
    }

    private func isSameMonth(as date: Date) -> Bool {
        let calendar = Calendar.current
        var compSet = Set<Calendar.Component>()
        compSet.insert(Calendar.Component.month)
        let currentComps: DateComponents = calendar.dateComponents(compSet, from: self)
        let dateComps: DateComponents = calendar.dateComponents(compSet, from: date)
        return dateComps.month! == currentComps.month!
    }

    func isSameYearAs(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let currentComps: DateComponents = calendar.dateComponents([.year], from: self)
        let dateComps: DateComponents = calendar.dateComponents([.year], from: date)
        return dateComps.year! == currentComps.year!
    }

    // MARK: -  Helper methods

    internal func adding(days: Int, using calendar: Calendar) -> Date {
        return calendar.date(byAdding: .day, value: days, to: self)!
    }
}

let calendar = Calendar.autoupdatingCurrent
