//
//  CategoryManager.swift
//  iFinance
//
//  Created by ITA student on 9/18/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

class CategoryManager: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryStorege.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableReusableCell")!
        let categoryRecord = categoryStorege[indexPath.row].getInfo()
        cell.textLabel?.text = categoryRecord.cName
        
        return cell
        
    }
    
}
