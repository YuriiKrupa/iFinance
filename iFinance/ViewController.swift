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
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableReusableCell")!
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

        //Add buttons to navigation bar
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.wayToTransaction))
        self.navigationItem.rightBarButtonItem  = add
        let categoryBtnEdit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.wayToCategory))
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
        self.performSegue(withIdentifier: "toCategoryManager", sender: self)
    }
    @objc func wayToTransaction(){
        self.performSegue(withIdentifier: "toTransaction", sender:self)
    }
    
}
