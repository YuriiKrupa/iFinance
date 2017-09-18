//
//  ViewController.swift
//  iFinance
//
//  Created by ITA student on 9/8/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

var categoryStorege: [Category] = [Category.init(name: "Food"), Category.init(name: "Utilities"), Category.init(name: "Cell phone")]
var transactionHistory = [Transaction]()


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var transactionList: UITableView!
    
    @IBOutlet weak var monthLabel: UILabel!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tebleReusableCell")!
        let transactionInfo = transactionHistory[indexPath.row].getInfo()
        cell.textLabel?.text = transactionInfo.actionName
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
        self.title = "iFinance"
        
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        let nameOfMonth = dateFormatter.string(from: now)
        monthLabel.text = nameOfMonth
        
//        let _ = categoryStorege.append(Category.init(name: "Food"))
//        let _ = categoryStorege.append(Category.init(name: "Utilities"))
//        let _ = categoryStorege.append(Category.init(name: "Cell phone"))

        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.wayToTransaction))
        let categoryBtnEdit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.wayToCategory))
        self.navigationItem.rightBarButtonItem  = add
        self.navigationItem.leftBarButtonItem = categoryBtnEdit
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        transactionList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @objc func wayToCategory(){
        self.performSegue(withIdentifier: "toCategory", sender: self)
    }
    @objc func wayToTransaction(){
        self.performSegue(withIdentifier: "toTransaction", sender:self)
    }
    
}

//class Transaction: NSObject {
//    static private var idCounter:Int = 0
//    private var id:              Int
//    private var categoty:        String
//    private var date:            Date
//    private var name:            String
//    private var descriptionText: String
//    private var value:           Double
//    
//    init(tCategory cat: String, tDate d: Date, tName n: String, tDescription descript: String, tValue val:Double) {
//        self.id                 = Transaction.idCounter
//        Transaction.idCounter  += 1
//        self.categoty           = cat
//        self.date               = d
//        self.name               = n
//        self.descriptionText    = descript
//        self.value              = val
//    }
//
//    static func getCount() -> Int {
//        return idCounter
//    }
//    
//    func getInfo() -> (actionDate: Date, actionName: String, actionDescription:String, actionCategory:String, actionValue:Double) {
//        return (date, name, descriptionText, categoty, value)
//    }
//    
//
//}

//class Category: NSObject, NSCoding {
//    
//    static private var idCounter: Int = 0
//    private var id:               Int
//    private var name:             String
//    private var descriptionText:  String
//    
//    func encode(with aCoder: NSCoder) {
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        self.name = (aDecoder.decodeObject(forKey: "name") as? String)!
//        self.descriptionText = (aDecoder.decodeObject(forKey: "descriptionText") as? String)!
//        self.id = (aDecoder.decodeObject(forKey: "id") as? Int)!
//    }
//    init(name n: String, decription d: String = "Description not specified") {
//        self.id              = Category.idCounter
//        Category.idCounter  += 1
//        self.name            = n
//        self.descriptionText = d
//    }
//    
//    static func getCount() -> Int {
//        return idCounter
//    }
//    
//    func getInfo() -> (cName: String, cDescription: String, cId: Int) {
//        return (name, descriptionText, id)
//    }
//    
//}

