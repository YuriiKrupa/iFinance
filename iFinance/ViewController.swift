//
//  ViewController.swift
//  iFinance
//
//  Created by ITA student on 9/8/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var transactionList: UITableView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var expeneceTotalValueLabel: UILabel!
    @IBOutlet weak var incomeTotalValuelLabel: UILabel!
    
    let model = TransferModel.transferModel
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableReusableCell")!
        let transactionInfo = model.getTransactionList()[indexPath.row].getInfo()
        cell.textLabel?.text = transactionInfo.actionName
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getTransactionList().count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //ЗАПИТАТИ!!!!
        //print(model.getTransactionList()[indexPath.row].getInfo().actionName)
        performSegue(withIdentifier: "transactionDetailed", sender: model.getTransactionList()[indexPath.row])
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let removeOpt = UITableViewRowAction(style: .destructive, title: "Remove") { action, index in
            _ = self.model.removeTransaction(byTransaction: (self.model.getTransactionList()[(indexPath.row)]))
            self.transactionList.reloadData()
            self.setUpView()
        }
        removeOpt.backgroundColor = UIColor.red
        
        return [removeOpt]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "iFinance"
        self.setUpView()
        let btnCategoryEdit = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(self.wayToCategory))
        self.navigationItem.leftBarButtonItem = btnCategoryEdit
        let btnShowChart = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(self.wayToPieChart))
        let btnTransactionAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.wayToTransaction))
        self.navigationItem.rightBarButtonItems = [btnTransactionAdd, btnShowChart]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if model.getCategoryList().isEmpty {
            model.addCategory(name: "Food", description: "Expences on food")
            model.addCategory(name: "Utilities", description: "Expences on food")
            model.addCategory(name: "Cell Phone", description: "Expences on food")
        }
        transactionList.reloadData()
        self.setUpView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpView() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        let nameOfMonth = dateFormatter.string(from: now)
        monthLabel.text = nameOfMonth
        
        totalValueLabel.textColor = UIColor.black
        totalValueLabel.text = model.getTotal()
        expeneceTotalValueLabel.textColor = UIColor.red
        expeneceTotalValueLabel.text = "-" +  model.getTotalExpence()
        incomeTotalValuelLabel.textColor = UIColor.green
        incomeTotalValuelLabel.text = "+" + model.getTotalIncome()
    }
  
    @objc func wayToCategory(){
        self.performSegue(withIdentifier: "toCategoryManager", sender: self)
    }
    @objc func wayToTransaction(){
        self.performSegue(withIdentifier: "toTransaction", sender:self)
    }
    @objc func wayToPieChart() {
        self.performSegue(withIdentifier: "toPieChart", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "transactionDetailed", let nextScene = segue.destination as? TransactionDetailed, let item = sender as? Transaction {
            nextScene.transactionTemp = item
        }
        
    }
}
