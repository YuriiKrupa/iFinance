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
    
    //MARK: TableView setup
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transferModel.getCategoryList().count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell")!
        let categoryRecord = transferModel.getCategoryList()[indexPath.row].getInfo()
        categoryCell.textLabel?.text = categoryRecord.cName
        return categoryCell
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let removeOpt = UITableViewRowAction(style: .destructive, title: "Remove") { action, index in
            _ = self.transferModel.removeCategory(byCategory: (self.transferModel.getCategoryList()[(indexPath.row)]))
            self.tableView.reloadData()
        }
        removeOpt.backgroundColor = UIColor.red
        return [removeOpt]
    }
    
    @objc func wayToNewCategory() {
        self.performSegue(withIdentifier: "newCategory", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editCategory" ,
            let nextScene = segue.destination as? CreateEditCategoryController,
            let indexPath = self.tableView.indexPathForSelectedRow {

            nextScene.categoryToEditIndex = indexPath
        }
    }
}
