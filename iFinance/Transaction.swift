//
//  Transaction.swift
//  iFinance
//
//  Created by ITA student on 9/13/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import Foundation

class Transaction: NSObject, NSCoding {
    
    //MARK: Class fields
    static private var idCounter:Int = 0
    
    //MARK: Instance fields
    private var id:              Int?
    private var categoty:        Category?
    private var date:            Date?
    private var name:            String?
    private var descriptionText: String?
    private var value:           Double?
    private var isIncome:        Bool?
    
    init(tCategory cat: Category, tDate d: Date, tName n: String, tDescription descript: String, tValue val:Double, type isIncome:Bool = false) {
        self.id                 = Transaction.idCounter
        self.categoty           = cat
        self.date               = d
        self.name               = n
        self.descriptionText    = descript
        self.value              = val
        self.isIncome           = isIncome
        
        Transaction.idCounter  += 1
    }
    
    //MARK: Class methods
    static func getCount() -> Int {
        return idCounter
    }
    
    //MARK: Instance methods
    func getId() -> Int {
        return id!
    }
    
    func getCagegory() -> Category {
        return categoty!
    }
    
    func getDate() -> Date {
        return date!
    }
    
    func getName() -> String {
        return name!
    }
    
    func getDescription() -> String {
        return descriptionText!
    }
    
    func getValue() -> Double {
        return value!
    }
    
    func isIncomeType() -> Bool {
        return isIncome!
    }
    func getInfo() -> (actionId: Int, actionDate: Date, actionName: String, actionDescription:String, actionCategory:Category, actionValue:Double, actionIsIncome:Bool) {
        return (id!, date!, name!, descriptionText!, categoty!, value!, isIncome!)
    }
    
    
    //MARK: Encode/decode functions
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id,              forKey: "id")
        aCoder.encode(self.categoty,        forKey: "category")
        aCoder.encode(self.date,            forKey: "date")
        aCoder.encode(self.name,            forKey: "name")
        aCoder.encode(self.descriptionText, forKey: "descriptionText")
        aCoder.encode(self.value,           forKey: "value")
        aCoder.encode(self.isIncome,        forKey: "isIncome")
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let idDecode = aDecoder.decodeObject(forKey: "id") as? Int {
            self.id                 = idDecode //(aDecoder.decodeObject(forKey: "id") as? Int)!
            self.categoty           = aDecoder.decodeObject(forKey: "category") as? Category ?? Category(name: "No Category")
            self.date               = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
            self.name               = aDecoder.decodeObject(forKey: "name") as? String ?? "No Name"
            self.descriptionText    = aDecoder.decodeObject(forKey: "descriptionText") as? String ?? ""
            self.value              = aDecoder.decodeObject(forKey: "value") as? Double ?? 0.0
            self.isIncome           = aDecoder.decodeObject(forKey: "isIncome") as? Bool ?? false
            
        }
    }
    
}
