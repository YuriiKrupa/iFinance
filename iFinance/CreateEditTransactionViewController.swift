//
//  CreateEditTransactionViewController.swift
//  iFinance
//
//  Created by ITA student on 9/17/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

class CreateEditTransactionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var descriptionTextArea: UITextView!
    @IBOutlet weak var dateDataPicker: UIDatePicker!
    
    var record: Transaction?
    var recordCategory: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Transaction"
        
        let categoryPicker = UIPickerView()
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        self.categoryTextField.inputAccessoryView = categoryPicker
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //MARK:
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //MARK: 
        return categoryStorege.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryStorege[row].getName()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categoryStorege[row].getName()
        recordCategory = categoryStorege[row]
    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
        if let name = nameTextField.text, let value = valueTextField.text {
            record = Transaction(tCategory: recordCategory!, tDate: dateDataPicker.date, tName: name, tDescription: descriptionTextArea.text, tValue: Double(value)!)
            transactionHistory.append(record!)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
