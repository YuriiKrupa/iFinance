//
//  Transaction.swift
//  iFinance
//
//  Created by ITA student on 9/13/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import Foundation

class Transaction: NSObject {
    static private var idCounter:Int = 0
    private var id:              Int
    private var categoty:        Category
    private var date:            Date
    private var name:            String
    private var descriptionText: String
    private var value:           Double
    
    init(tCategory cat: Category, tDate d: Date, tName n: String, tDescription descript: String, tValue val:Double) {
        self.id                 = Transaction.idCounter
        Transaction.idCounter  += 1
        self.categoty           = cat
        self.date               = d
        self.name               = n
        self.descriptionText    = descript
        self.value              = val
    }
    
    static func getCount() -> Int {
        return idCounter
    }
    
    func getInfo() -> (actionDate: Date, actionName: String, actionDescription:String, actionCategory:Category, actionValue:Double) {
        return (date, name, descriptionText, categoty, value)
    }
    
    
}
