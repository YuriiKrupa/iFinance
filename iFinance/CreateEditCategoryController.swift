//
//  CreateEditCategoryController.swift
//  iFinance
//
//  Created by ITA student on 9/18/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

class CreateEditCategoryController: UIViewController {
    
    var categoryToEditIndex: IndexPath?
//    private var categoryItem:[]
    var categoryList = TransferModel.transferModel.getCategoryList()
    let model = TransferModel.transferModel
    
    
    @IBOutlet weak var categoryIdLabel:             UILabel!
    @IBOutlet weak var categoryNameTextField:       UITextField!
    @IBOutlet weak var categoryDescriptionTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveCategory))
        categoryIdLabel.text = String(categoryList.count)//Category.getCount())
        isEditing()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // isEditing()
        
    }
    
    private func isEditing() {
        
        if var index = categoryToEditIndex {
            let categoryItem = categoryList[index.row] //categoryStorege[index.row].getInfo()
            categoryIdLabel.text = categoryItem.getInfo().cName
            categoryNameTextField.text = categoryItem.getInfo().cName
            categoryDescriptionTextArea.text = categoryItem.getInfo().cDescription
        }
    }
    
    @objc func saveCategory() {
        model.addCategory(name: categoryNameTextField.text!, desctiption: categoryDescriptionTextArea.text!)
        //categoryList(Category.init(name: categoryNameTextField.text!, decription: categoryDescriptionTextArea.text!))
        //categoryStorege.append(Category.init(name: categoryNameTextField.text!, decription: categoryDescriptionTextArea.text!))
        _ = navigationController?.popViewController(animated: true)
        model.codeCategories()
    }
}
