//
//  Category.swift
//  iFinance
//
//  Created by ITA student on 9/17/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import Foundation

class Category: NSObject, NSCoding {
    
    //MARK: Class fields
    static private var idCounter: Int = 0
    
    //MARK: Instance fields
    private var id:               Int?
    private var name:             String?
    private var descriptionText:  String?
    
    init(name n: String, decription d: String = "Description not specified") {
        self.id              = Category.idCounter
        self.name            = n
        self.descriptionText = d
        
        Category.idCounter  += 1
    }
    init(id:Int, name n: String, decription d: String = "Description not specified") {
        self.id              = id
        self.name            = n
        self.descriptionText = d
    }
    func makeTemp(id:Int, name: String, decriptionTemp: String = "Description not specified") -> Category {
        return Category.init(id: id, name: name, decription: decriptionTemp)
    }
    
    //MARK: Class methods
    static func getCount() -> Int {
        return idCounter
    }
    
    func getInfo() -> ( cId: Int, cName: String, cDescription: String) {
        return (id!, name!, descriptionText!)
    }
    
    //MARK: Encode/decode functions
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id,              forKey: "id")
        aCoder.encode(self.name,            forKey: "name")
        aCoder.encode(self.descriptionText, forKey: "descriptionText")
    }
    
    required init? (coder aDecoder: NSCoder) {
        if let idDecode = aDecoder.decodeObject(forKey: "id") as? Int {
            self.id              = idDecode //(aDecoder.decodeObject(forKey: "id") as? Int)!
            self.name            = aDecoder.decodeObject(forKey: "name") as? String ?? "No Name"
            self.descriptionText = aDecoder.decodeObject(forKey: "descriptionText") as? String ?? "No description"
        }
    }
    
}
