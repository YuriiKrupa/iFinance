//
//  Category.swift
//  iFinance
//
//  Created by ITA student on 9/17/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import Foundation

class Category: NSObject, NSCoding {
    
    static private var idCounter: Int = 0
    private var id:               Int
    private var name:             String
    private var descriptionText:  String
    
    func encode(with aCoder: NSCoder) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = (aDecoder.decodeObject(forKey: "name") as? String)!
        self.descriptionText = (aDecoder.decodeObject(forKey: "descriptionText") as? String)!
        self.id = (aDecoder.decodeObject(forKey: "id") as? Int)!
    }
    init(name n: String, decription d: String = "Description not specified") {
        self.id              = Category.idCounter
        Category.idCounter  += 1
        self.name            = n
        self.descriptionText = d
    }
    
    static func getCount() -> Int {
        return idCounter
    }
    
    func getName() -> String {
        return name
    }
    
    func getInfo() -> (cName: String, cDescription: String, cId: Int) {
        return (name, descriptionText, id)
    }
    
}
