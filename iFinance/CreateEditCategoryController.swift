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
    let model = TransferModel.transferModel
    var categoryList = TransferModel.transferModel.getCategoryList()
    
    @IBOutlet weak var categoryNameTextField:       UITextField!
    @IBOutlet weak var categoryDescriptionTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryDescriptionTextArea.layer.borderWidth = 1
        //MARK: Configure view apearance Edit || New
        if categoryToEditIndex != nil {
            self.title = "Edit"
            self.navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveCategory))
            _ = setFields(category: categoryList[(categoryToEditIndex?.row)!])
    
        } else {
            self.title = "New"
            self.navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.saveCategory))
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setFields (category: Category) {
        categoryNameTextField.text = category.getInfo().cName
        categoryDescriptionTextArea.text = category.getInfo().cDescription
    }
    private func getFields () -> (fName: String, fDescription: String) {
        return (categoryNameTextField.text!, categoryDescriptionTextArea.text!)
    }
    @objc private func saveCategory() {
        if categoryToEditIndex != nil {
            let categoryItem = categoryList[(categoryToEditIndex?.item)!]
            _ = model.updateCategory(byCategory: categoryItem, name: getFields().fName, description: getFields().fDescription)
        } else { model.addCategory(name: categoryNameTextField.text!, description: categoryDescriptionTextArea.text!) }
        _ = navigationController?.popViewController(animated: true)
    }
}
