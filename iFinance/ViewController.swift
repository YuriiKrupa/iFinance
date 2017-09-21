//
//  ViewController.swift
//  iFinance
//
//  Created by ITA student on 9/8/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

//var categoryStorege = [Category]()//: [Category] = [Category.init(name: "Food"), Category.init(name: "Utilities"), Category.init(name: "Cell phone")]
//var transactionHistory = [Transaction]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var transactionList: UITableView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var lbExpeneceTotalValue: UILabel!
    
    let model = TransferModel.transferModel
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableReusableCell")!
        let transactionInfo = model.getTransactionList()[indexPath.row].getInfo() //transactionHistory[indexPath.row].getInfo()
        cell.textLabel?.text = transactionInfo.actionName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getTransactionList().count //transactionHistory.count
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "iFinance"

        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        let nameOfMonth = dateFormatter.string(from: now)
        monthLabel.text = nameOfMonth
        
        let btnCategoryEdit = UIBarButtonItem(title: "Categories", style: .plain, target: self, action: #selector(self.wayToCategory))
        self.navigationItem.leftBarButtonItem = btnCategoryEdit
        let btnTransactionAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.wayToTransaction))
        self.navigationItem.rightBarButtonItem  = btnTransactionAdd
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        model.decodeCategories()
        model.decodeTransactions()
        transactionList.reloadData()
//        var balance = Double()
//        for index in model.getTransactionList(){
//            balance += index.getValue()
//        }
        lbExpeneceTotalValue.textColor = UIColor.red
        lbExpeneceTotalValue.text = model.getTotalExpence()//String(balance)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
  
    @objc func wayToCategory(){
        self.performSegue(withIdentifier: "toCategoryManager", sender: self)
    }
    @objc func wayToTransaction(){
        self.performSegue(withIdentifier: "toTransaction", sender:self)
    }
 
    
}
