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
    //var isInEdit = false
    
    
    @IBOutlet weak var categoryIdLabel:             UILabel!
    @IBOutlet weak var categoryNameTextField:       UITextField!
    @IBOutlet weak var categoryDescriptionTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryDescriptionTextArea.layer.borderWidth = 1
       // categoryDescriptionTextArea.layer.borderColor = 
        //categoryIdLabel.text = String(categoryList.count)//Category.getCount())
        //isInEdit = isEditing()
        if categoryToEditIndex != nil {
            self.title = "Edit"
            self.navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveCategory))
            if let category:Category = categoryList[(categoryToEditIndex?.row)!] {
                setFields(category: category)
            }
    
        } else {
            self.title = "New"
            self.navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.saveCategory))
            categoryIdLabel.text = String(categoryList.count)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // isEditing()
    
        
    }
    
    private func setFields (category: Category) {
        categoryIdLabel.text = "\(category.getInfo().cId)"
        categoryNameTextField.text = category.getInfo().cName
        categoryDescriptionTextArea.text = category.getInfo().cDescription
    }
    private func getFields () -> (fName: String, fDescription: String){
        return (categoryNameTextField.text!, categoryDescriptionTextArea.text!)
        
    }
    
   /* private func isEditing() -> Bool{
        //var isEditing = false
        if var index = categoryToEditIndex {
            let categoryItem = categoryList[index.row] //categoryStorege[index.row].getInfo()
            categoryIdLabel.text = "\(categoryItem.getInfo().cId)"
            categoryNameTextField.text = categoryItem.getInfo().cName
            categoryDescriptionTextArea.text = categoryItem.getInfo().cDescription
            //isEditing = true
            return true
        }
        return false //isEditing
    }*/
    
    @objc func saveCategory() { //_ editing: Bool = false) {
        if categoryToEditIndex != nil {
            let i = categoryList[(categoryToEditIndex?.item)!]
            let ii = Category(id: i.getInfo().cId, name: getFields().fName, decription: getFields().fDescription)
            _ = model.updateCategory(category: ii)
        } else {
            model.addCategory(name: categoryNameTextField.text!, description: categoryDescriptionTextArea.text!)
        }
        
        _ = navigationController?.popViewController(animated: true)
        model.codeCategories()
        /*if !isInEdit {
            model.addCategory(name: categoryNameTextField.text!, description: categoryDescriptionTextArea.text!)
            //categoryList(Category.init(name: categoryNameTextField.text!, decription: categoryDescriptionTextArea.text!))
            //categoryStorege.append(Category.init(name: categoryNameTextField.text!, decription: categoryDescriptionTextArea.text!))
            
        } else {
            print("\(model.updateCategory(category:  categoryList[categoryToEditIndex!.row]))")
        }
        _ = navigationController?.popViewController(animated: true)
        model.codeCategories()
     */
    }
}
