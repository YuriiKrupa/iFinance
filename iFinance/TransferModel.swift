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
    private let categoriesPath:         String?
    private let transactionsPath:       String?
    
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
        self.decodeCategories()
        self.decodeTransactions()
    }
    
    //MARK: Categories functions
    func getCategoryList() -> [Category]{
        self.decodeCategories()
        return categoryStorage
    }
    func addCategory(category: Category) {
        categoryStorage.append(category)
        self.codeCategories()
    }
    func addCategory(name: String, description: String = "") {
        categoryStorage.append(Category(name: name, decription: description))
        self.codeCategories()
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
            //FIXME: Refactor acording DRY
            let index = categoryStorage.index(of: byCategory)
            if description != "" {
                categoryStorage[index!] = Category.init(id: byCategory.getInfo().cId, name: name, decription: description)
            } else {
                categoryStorage[index!] = Category.init(id: byCategory.getInfo().cId, name: name, decription: categoryStorage[index!].getInfo().cDescription)
            }
            self.codeCategories()
            return true
        }
        return false
    }
    func updateCategory(byCategoryName: String, name: String, description: String = "") -> Bool {
        for i in categoryStorage {
            if i.getInfo().cName == byCategoryName {
                //FIXME: Refactor acording DRY
                let index = categoryStorage.index(of: i)
                if description != "" {
                    categoryStorage[index!] = Category.init(id: i.getInfo().cId, name: name, decription: description)
                } else {
                    categoryStorage[index!] = Category.init(id: i.getInfo().cId, name: name, decription: categoryStorage[index!].getInfo().cDescription)
                }
                self.codeCategories()
                return true
            }
        }
        return false
    }
    func removeCategory(byCategory: Category?) -> Bool {
        if let index = categoryStorage.index(of: byCategory!) {
            categoryStorage.remove(at: index)
            self.codeCategories()
            return true
        }
        return false
    }
    
    //MARK: NSCoding for Category List
    func codeCategories(){
        if categoriesPath != nil {
            _ = NSKeyedArchiver.archiveRootObject(categoryStorage, toFile: categoriesPath!)
        }
    }
    func decodeCategories(){
        if categoriesPath != nil, let categoryList = NSKeyedUnarchiver.unarchiveObject(withFile: categoriesPath!) as? [Category] {
            categoryStorage = categoryList
        }
    }
    
    //MARK: Transactions functions
    func getTransactionList() -> [Transaction] {
        self.decodeTransactions()
        return transactionsStorage
    }
    func addTransaction(name title: String, category c: Category, value v: Double, date d: Date = Date(), ddescription descript: String = "", isIncomeType type: Bool = false) {
        if type != false {
            transactionsStorage.append(Transaction(tCategory: c, tDate: d, tName: title, tDescription: descript, tValue: v, type: type))
        } else {
            transactionsStorage.append(Transaction(tCategory: c, tDate: d, tName: title, tDescription: descript, tValue: v))
        }
        self.codeTransactions()
    }
    func addTransaction(transaction instance:Transaction) {
        transactionsStorage.append(instance)
        self.codeTransactions()
    }
    func getTotalExpence() -> String {
        var expenceTemp = 0.0
        for i in transactionsStorage {
            if !i.getInfo().actionIsIncome {
                expenceTemp += i.getInfo().actionValue
            }
        }
        return String(format:"%.2f", expenceTemp)
    }
    func getTotalIncome() -> String {
        var incomeTemp = 0.0
        for i in transactionsStorage {
            if i.getInfo().actionIsIncome {
                incomeTemp += i.getInfo().actionValue
            }
        }
        return String(format:"%.2f", incomeTemp)
    }
    func getTotal() -> String {
        var temp = 0.0
        for i in transactionsStorage{
            if i.getInfo().actionIsIncome { temp += i.getInfo().actionValue } else { temp -= i.getInfo().actionValue }
        }
        return String(format:"%.2f", temp)
    }
    func updateTransaction(byTransaction: Transaction, name: String, category: Category, value: Double, date: Date, description: String = "", isIncome: Bool) -> Bool {
        if transactionsStorage.contains(byTransaction) {
            for i in transactionsStorage {
                if i == byTransaction {
                    transactionsStorage[transactionsStorage.index(of: byTransaction)!] = Transaction(id: i.getInfo().actionId, category: category, date: date, name: name, description: description, value: value, isIncome: isIncome)
                    self.codeTransactions()
                    return true
                }
            }
        }
        return false
    }

    func removeTransaction(byTransaction: Transaction? = nil, byName: String? = nil) -> Bool {
        if let transaction = byTransaction {
            self.transactionsStorage.remove(at: transactionsStorage.index(of: transaction)!)
            self.codeTransactions()
            return true
        }
        if let name = byName {
            for index in transactionsStorage {
                if index.getInfo().actionName == name {
                    self.transactionsStorage.remove(at: transactionsStorage.index(of: index)!)
                    self.codeTransactions()
                    return true
                }
            }
        }
        return false
    }
    
    //MARK: NSCoding for Transaction list
    func codeTransactions() {
        if transactionsPath != nil {
            _ = NSKeyedArchiver.archiveRootObject(transactionsStorage, toFile: transactionsPath!)
        }
    }
    
    func decodeTransactions() {
        if transactionsPath != nil, let transactionList = NSKeyedUnarchiver.unarchiveObject(withFile: transactionsPath!) as? [Transaction]{
            transactionsStorage = transactionList
        }
    }
}
