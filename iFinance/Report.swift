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
    
    func inRange(from d1:Date, to d2:Date) -> [Transaction]{
        let transactionList = model.getTransactionList()
        var range = [Transaction]()
            for item in transactionList {
                if item.getInfo().actionDate > d1 && item.getInfo().actionDate < d2 {
                    range.append(item)
                }
            }
        return range
    }
    
}
