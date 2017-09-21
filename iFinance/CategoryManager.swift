//
//  CategoryManager.swift
//  iFinance
//
//  Created by ITA student on 9/18/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

class CategoryManager: UITableViewController {
    
    let transferModel = TransferModel.transferModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(wayToNewCategory))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transferModel.getCategoryList().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell")!
        let categoryRecord = transferModel.getCategoryList()[indexPath.row].getInfo()//categoryStorege[indexPath.row].getInfo()
        categoryCell.textLabel?.text = categoryRecord.cName
        
       return categoryCell
        
    }
    
    @objc func wayToNewCategory() {
        self.performSegue(withIdentifier: "newCategory", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editCategory" ,
            let nextScene = segue.destination as? CreateEditCategoryController,
            let indexPath = self.tableView.indexPathForSelectedRow {
            //let selectedItem = toDoListItems[indexPath.row]
            nextScene.categoryToEditIndex = indexPath
        }
    }
}
