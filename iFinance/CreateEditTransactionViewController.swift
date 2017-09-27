//
//  CreateEditTransactionViewController.swift
//  iFinance
//
//  Created by ITA student on 9/17/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

class CreateEditTransactionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nameTextField:       UITextField!
    @IBOutlet weak var categoryTextField:   UITextField!
    @IBOutlet weak var valueTextField:      UITextField!
    @IBOutlet weak var descriptionTextArea: UITextView!
    @IBOutlet weak var dateDataPicker:      UIDatePicker!
    
    @IBOutlet weak var transactionTypeSwitch: UISwitch!
    
    let model = TransferModel.transferModel
    var record: Transaction?
    var recordCategory: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextArea.layer.borderWidth = 1
        //descriptionTextArea.layer.borderColor = UIColor.lightGray as! CGColor
        let categoryPicker = UIPickerView()
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        categoryPicker.backgroundColor = UIColor.white
        self.categoryTextField.inputAccessoryView = categoryPicker
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveTransaction))
        
        if record == nil {
            self.title = "New"
            
        } else {
            self.title = "Edit"
            setProperties()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.getCategoryList().count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return model.getCategoryList()[row].getInfo().cName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = model.getCategoryList()[row].getInfo().cName
        recordCategory = model.getCategoryList()[row]
    }
    
    private func setProperties() {
        nameTextField.text = record?.getInfo().actionName
        categoryTextField.text = record?.getInfo().actionCategory.getInfo().cName
        valueTextField.text = "\((record?.getInfo().actionValue)!)"
        descriptionTextArea.text = record?.getInfo().actionDescription ?? " "
        print("\(record?.getInfo().actionDescription ?? "Missing")")
        dateDataPicker.date = (record?.getInfo().actionDate)!
        transactionTypeSwitch.setOn(!(record?.getInfo().actionIsIncome)!, animated: true)
    }
    
    @objc func saveTransaction() {
        if record == nil {
            if let name = nameTextField.text, let value = valueTextField.text {
                if transactionTypeSwitch.isOn {
                    record = Transaction(tCategory: recordCategory!, tDate: dateDataPicker.date, tName: name, tDescription: descriptionTextArea.text, tValue: Double(value)!)
                } else {
                    record = Transaction(tCategory: recordCategory!, tDate: dateDataPicker.date, tName: name, tDescription: descriptionTextArea.text, tValue: Double(value)!, type: true)
                }
                model.addTransaction(transaction: record!)
                //transactionHistory.append(record!)
            }
        } else {
            //FIXME: bug - unwrapping an Optional value for test, test2, test4 transactions
            _ = model.updateTransaction(byTransaction: record!, name: nameTextField.text!, category: model.getGategory(byName: categoryTextField.text!)!, value: Double(valueTextField.text!)!, date: dateDataPicker.date, description: descriptionTextArea.text ?? "" , isIncome: !transactionTypeSwitch.isOn)
        }
        //model.codeTransactions()
        _ = navigationController?.popToRootViewController(animated: true)
    	
    }
    
    
  
}
