//
//  Category.swift
//  iFinance
//
//  Created by ITA student on 9/17/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import Foundation

class Category: NSObject, NSCoding {
    
    //MARK: Instance fields
    private var id: UUID?
    private var name: String?
    private var descriptionText: String?
    
    init(name: String, decription text: String?) {
        self.id = UUID.init()
        self.name = name
        self.descriptionText = text
        
    }
    init(id:UUID, name: String, decription text: String?) {
        self.id = id
        self.name = name
        self.descriptionText = text
    }
    func makeTemp(id:UUID, name: String, decriptionTemp: String?) -> Category {
        return Category.init(id: id, name: name, decription: decriptionTemp)
    }
    
    func getInfo() -> ( cId: UUID, cName: String, cDescription: String) {
        return (id!, name!, descriptionText!)
    }
    
    //MARK: Encode/decode functions
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.descriptionText, forKey: "descriptionText")
    }
    required init? (coder aDecoder: NSCoder) {
        if let idDecode = aDecoder.decodeObject(forKey: "id") as? UUID {
            self.id = idDecode
            self.name = aDecoder.decodeObject(forKey: "name") as? String ?? "No Name"
            self.descriptionText = aDecoder.decodeObject(forKey: "descriptionText") as? String ?? "No description"
        }
    }
}
