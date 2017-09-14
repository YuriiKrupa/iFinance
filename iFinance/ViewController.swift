//
//  ViewController.swift
//  iFinance
//
//  Created by ITA student on 9/8/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

var transactionHistory = [Transaction]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var transactionList: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tebleReusableCell")!
        let transactionInfo = transactionHistory[indexPath.row].info()
        cell.textLabel?.text = transactionInfo.actionDescription
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionHistory.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        let item = transactionHistory[indexPath.row]
//        let itemInfo = item.info()
//        let title : String = itemInfo.actionName
//
//        cell.textLabel?.text = title
//
//        return cell
//    }
//

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        transactionList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   // var categoryList = [String: String]()
  
    
}




class Transaction: NSObject {/*}, NSCoding {
    func encode(with aCoder: NSCoder) {
        <#code#>
    }
    
    required init?(coder aDecoder: NSCoder) {
        <#code#>
    }*/
    
    var categoty:String
    private var date:Date
    private var name:String
    private var transactionDescription:String
    private var total:String//NSDecimalNumber
    
    init(tCategory cat: String, tDate d: Date, tName n: String, tDescription desc: String, tTotal tot:String) {//NSDecimalNumber ) {
        self.categoty = cat
        self.date = d
        self.name = n
        self.transactionDescription = desc
        self.total = tot
    }
    
    func info() -> (actionDate: Date, actionName: String, actionDescription:String, actionCategory:String, actionTotal:String) {
        return (date, name, transactionDescription, categoty, total)
    }
    
    //return (name: self.name, category: self.category, date: self.date, description: self.description, total: self.total)
}
