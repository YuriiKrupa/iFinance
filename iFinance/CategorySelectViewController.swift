//
//  CategorySelectViewController.swift
//  iFinance
//
//  Created by ITA student on 9/10/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

class CategorySelectViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var categoryArr = ["Food", "Entertainment", "Utilities", "Cell phone"]
    
    //var category = Set(["Food", "Entertainment", "Utilities", "Cell phone"])
    
    @IBOutlet weak var abel1: UILabel!
//    @IBOutlet weak var CategoryPickerView: UIPickerView!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        CategoryPickerView.isHidden = true
        let datePicker = UIPickerView()
        datePicker.delegate = self
        datePicker.dataSource = self
        self.categoryTextField.inputAccessoryView = datePicker
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArr.count
        //return category.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArr[row]
        //return category
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {	
        abel1.text = categoryArr[row]
        categoryTextField.text = categoryArr[row]
    }
   
    @IBAction func btnTest1(_ sender: UIButton) {
//        CategoryPickerView.isHidden = !CategoryPickerView.isHidden
    }
    
    @IBAction func btnAddCategory(_ sender: UIButton) {
        categoryArr.append(categoryTextField.text!)
  //      CategoryPickerView.reloadAllComponents()
    }
    
    @IBAction func saveTransactionBtn(_ sender: Any) {
        var transactionItem = Transaction(transactionCategory: categoryTextField.text!, date: datePickerView.date, name: nameTextField.text!, transactionDescription: nameTextField.text!, total:totalTextField.text!)
        
        var transInfo = transactionItem.info()
        showWarningMsg(textMsg: "Name: \(transInfo.actionName)\nCategory: \(transInfo.actionCategory)\nDate: \(transInfo.actionDate)\nDescription: \(transInfo.actionDescription)\nTotal: \(transInfo.actionTotal)")
        
        transactionHistory.append(transactionItem)
    }
    
    private func showWarningMsg(textMsg: String) {
        let alert = UIAlertController(title: "Warning!", message: textMsg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
