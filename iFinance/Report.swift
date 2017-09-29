//
//  Report.swift
//  iFinance
//
//  Created by ITA student on 9/23/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import Foundation

class Report {
    let model = TransferModel.transferModel
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
    
    func calculateByDate(between from: Date, and to: Date) -> [(name: String, value: Double, category: String)] {
        var resultArray: [(name: String, value: Double, category: String)] = []
        for transaction in model.getTransactionList() {
            
        }
        
        return resultArray
    }
    
}
