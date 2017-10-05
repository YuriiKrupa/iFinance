//
//  ReportModel.swift
//  iFinance
//
//  Created by ITA student on 9/23/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import Foundation

class ReportModel {
    private let model = TransferModel.transferModel
    var report: [(name: String, date: Date, value: Double, category: Category, isIncome: Bool)] = []
    //TODO: Memory leak, maybe rewrite as singletone but what about init???....
    init() {
//        var report: [(name: String, date: Date, value: Double, category: Category, isIncome: Bool)] = []
        for transaction in model.getTransactionList() {
            let date = transaction.getInfo().actionDate
            let name = transaction.getInfo().actionName
            let value = transaction.getInfo().actionValue
            let category = transaction.getInfo().actionCategory
            let incomeType = transaction.getInfo().actionIsIncome
            
            report.append((name: name, date: date, value: value, category: category, isIncome: incomeType))
        }
    }
    
    func getRange(from: Date, to: Date) -> [(name: String, date: Date, value: Double, category: Category, isIncome: Bool)] {
        var result = report.filter({ $0.date >= from && $0.date <= to })
        return result
    }
    func getToday() -> [(name: String, date: Date, value: Double, category: Category, isIncome: Bool)] {
        if let dayProp = setDayStartEnd(Date()) { return getRange(from: dayProp.start, to: dayProp.end) }
        //FIXME: Think about fail return
        return getRange(from: setDaysBefore(0)!, to: setDayStartEnd(Date())!.end)
    }
    private func setDaysBefore(_ dayCount: Int) -> Date? {
        let calendar = Calendar.current
        if let daysBefore = calendar.date(byAdding: .day, value: -dayCount, to: Date()) {
            if let day = setDayStartEnd(daysBefore)?.start { return day }
        }
        return nil
    }
    private func setDayStartEnd(_ day: Date) -> (start: Date, end: Date)? {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        //FIXME: redo nil return
        guard let dayStart: Date = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: day), let dayEnd: Date = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: day) else { return nil }
        return (dayStart, dayEnd)
    }
    
}
