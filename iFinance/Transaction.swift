//
//  Transaction.swift
//  iFinance
//
//  Created by ITA student on 9/13/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import Foundation

class Transaction: NSObject, NSCoding {
    
    //MARK: Instance properties
    private var id: UUID?
    private var categoty: Category?
    private var date: Date?
    private var name: String?
    private var descriptionText: String?
    private var value: Double?
    private var isIncome: Bool?
    
    init(tCategory: Category, tDate: Date, tName: String, tDescription text: String, tValue value:Double, type isIncome:Bool = false) {
        self.id = UUID.init()
        self.categoty = tCategory
        self.date = tDate
        self.name = tName
        self.descriptionText = text
        self.value = value
        self.isIncome = isIncome
    }
    init(id: UUID, category: Category, date: Date, name: String, description: String, value: Double, isIncome: Bool = false) {
        self.id = id
        self.categoty = category
        self.date = date
        self.name = name
        self.descriptionText = description
        self.value = value
        self.isIncome = isIncome
    }
    //MARK: Instance methods
    func getInfo() -> (actionId: UUID, actionDate: Date, actionName: String, actionDescription:String, actionCategory:Category, actionValue:Double, actionIsIncome:Bool) {
        return (id!, date!, name!, descriptionText!, categoty!, value!, isIncome!)
    }
    //MARK: Encode/decode functions
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.categoty, forKey: "category")
        aCoder.encode(self.date, forKey: "date")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.descriptionText, forKey: "descriptionText")
        aCoder.encode(self.value, forKey: "value")
        aCoder.encode(self.isIncome, forKey: "isIncome")
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let idDecode = aDecoder.decodeObject(forKey: "id") as? UUID {
            self.id = idDecode
            self.categoty = aDecoder.decodeObject(forKey: "category") as? Category ?? Category.init(name: "NoCategory", decription: nil)
            self.date = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
            self.name = aDecoder.decodeObject(forKey: "name") as? String ?? "No Name"
            self.descriptionText = aDecoder.decodeObject(forKey: "descriptionText") as? String ?? ""
            self.value = aDecoder.decodeObject(forKey: "value") as? Double ?? 0.0
            self.isIncome = aDecoder.decodeObject(forKey: "isIncome") as? Bool ?? false
            
        }
    }
    
}
