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
        //FIXME: NEED correct return
        return result
    }
    func getToday() -> [(name: String, date: Date, value: Double, category: Category, isIncome: Bool)] {
        let cal: Calendar = Calendar(identifier: .gregorian)
        let dayStart: Date = cal.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
        let dayEnd: Date = cal.date(bySettingHour: 23, minute: 59, second: 59, of: Date())!
        return getRange(from: dayStart, to: dayEnd)
    }
    
//    func calculateByDate(between from: Date, and to: Date) -> [(name: String, value: Double, category: String)] {
//        var resultArray: [(name: String, value: Double, category: String)] = []
//        for transaction in model.getTransactionList() {
//
//        }
//
//        return resultArray
//    }
    
}
