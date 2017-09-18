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
    
    
    @IBOutlet weak var categoryIdLabel: UILabel!
    
    @IBOutlet weak var categoryNameTextField: UITextField!
    
    @IBOutlet weak var categoryDescriptionTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: saveCategory())
        isEditing()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // isEditing()
        
    }
    
    private func isEditing() {
        
        if var index = categoryToEditIndex {
            let categoryItem = categoryStorege[index.row].getInfo()
            categoryIdLabel.text = String(categoryItem.cId)
            categoryNameTextField.text = categoryItem.cName
            categoryDescriptionTextArea.text = categoryItem.cDescription
        }
    }
    
    func saveCategory() {
        
    }
}
