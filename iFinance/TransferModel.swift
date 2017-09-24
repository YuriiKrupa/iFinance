//
//  TransferModel.swift
//  iFinance
//
//  Created by ITA student on 9/20/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import Foundation

class TransferModel {
    
    
    private var categoryStorage:        [Category]     = []
    private var transactionsStorage:    [Transaction]  = []
    private let fileManager                            = FileManager()
    
    private let categoriesPath:   String?
    private let transactionsPath: String?
    
    static let transferModel = TransferModel()
    
    
    private init(){
        //Prepare for Archiving data to files
        let documentDirectoryUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
        if let documentDirectoryUrl = documentDirectoryUrls.first {
            self.categoriesPath    = documentDirectoryUrl.appendingPathComponent("categories.archive").path
            self.transactionsPath  = documentDirectoryUrl.appendingPathComponent("transactions.archive").path
        } else {
            self.categoriesPath   = nil
            self.transactionsPath = nil
        }
        
    }
    
    //MARK: Categories functions
    
    func getCategoryList() -> [Category]{
        return categoryStorage
    }
    
    func addCategory(category: Category) {
        categoryStorage.append(category)
    }
    func addCategory(name: String, description: String = "") {
        categoryStorage.append(Category(name: name, decription: description))
    }
    func getGategory(byName name: String) -> Category? {
        for i in categoryStorage {
            if i.getInfo().cName == name {
                return i
            }
        }
        return nil
    }
    func updateCategory(byCategory: Category, name: String, description: String = "") -> Bool {
        if categoryStorage.contains(byCategory) {
            // TODO: Refactor acording DRY
            let index = categoryStorage.index(of: byCategory)
            if description != "" {
                categoryStorage[index!] = Category.init(id: byCategory.getInfo().cId, name: name, decription: description)
            } else {
                categoryStorage[index!] = Category.init(id: byCategory.getInfo().cId, name: name, decription: categoryStorage[index!].getInfo().cDescription)
            }
            return true
        }
        return false
    }
    func updateCategory(byCategoryName: String, name: String, description: String = "") -> Bool {
        for i in categoryStorage {
            if i.getInfo().cName == byCategoryName {
                let index = categoryStorage.index(of: i)
                if description != "" {
                    categoryStorage[index!] = Category.init(id: i.getInfo().cId, name: name, decription: description)
                } else {
                    categoryStorage[index!] = Category.init(id: i.getInfo().cId, name: name, decription: categoryStorage[index!].getInfo().cDescription)
  
                }
                return true
            }
        }
        return false
    }
    
    
    //MARK: NSCoding for Category List
    func codeCategories(){
        if categoriesPath != nil {
            let success = NSKeyedArchiver.archiveRootObject(categoryStorage, toFile: categoriesPath!)
            if !success {
                print("Unable to save array to \(categoriesPath!)")
            } else {
                print("File not found")
            }
        }
        
    }
    
    func decodeCategories(){
        if categoriesPath != nil,
            let categoryList = NSKeyedUnarchiver.unarchiveObject(withFile: categoriesPath!) as? [Category]
        {
            categoryStorage = categoryList
        } else {
            print("File not found")
        }
        
    }
    
    //MARK: Transactions functions
    
    func getTransactionList() -> [Transaction] {
        return transactionsStorage
    }
    
    //func getTransactionItem(indexPath: IndexPath) -> Transaction {
    //    return transactionsStorage[indexPath.row]
   // }
    
    func addTransaction(name title: String, category c: Category, value v: Double, date d: Date = Date(), ddescription descript: String = "", isIncomeType type: Bool = false) {
        if type != false {
            transactionsStorage.append(Transaction(tCategory: c, tDate: d, tName: title, tDescription: descript, tValue: v, type: type))
        } else {
            transactionsStorage.append(Transaction(tCategory: c, tDate: d, tName: title, tDescription: descript, tValue: v))
        }
    }
    func addTransaction(transaction instance:Transaction) {
        transactionsStorage.append(instance)
    }
    func getTotalExpence() -> String {
        var expenceTemp = 0.0
        for i in transactionsStorage {
            if !i.isIncomeType() {
                expenceTemp += i.getValue()
            }
        }
        return String(format:"%.2f", expenceTemp)
    }
    func getTotalIncome() -> String {
        var incomeTemp = 0.0
        for i in transactionsStorage {
            if i.isIncomeType() {
                incomeTemp += i.getValue()
            }
        }
        return String(format:"%.2f", incomeTemp)
    }
    func getTotal() -> String {
        var temp = 0.0
        for i in transactionsStorage{
            if i.isIncomeType() { temp += i.getInfo().actionValue } else { temp -= i.getInfo().actionValue }
        }
        return String(format:"%.2f", temp)
    }
    
    
    //MARK: NSCoding for Transaction list
    func codeTransactions() {
        if transactionsPath != nil {
            let success = NSKeyedArchiver.archiveRootObject(transactionsStorage, toFile: transactionsPath!)
            if !success {
                print("Unable to save array to \(transactionsPath!)")
            } else {
                print("File not found")
            }
        }
    }
    
    func decodeTransactions() {
        if transactionsPath != nil, let transactionList = NSKeyedUnarchiver.unarchiveObject(withFile: transactionsPath!) as? [Transaction]{
            transactionsStorage = transactionList
        } else {
            print("File not found")
        }
    }
    
}
