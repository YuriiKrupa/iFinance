//
//  TransactionDetailed.swift
//  iFinance
//
//  Created by ITA student on 9/23/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit

class TransactionDetailed: UIViewController {
    
    var transactionTemp: Transaction?
    
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transaction"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(wayToTransactionEdit))
        
        //TODO: finish editing feathure
        //self.navigationItem.rightBarButtonItem?.isEnabled = false
        //descriptionTextView.layer.borderWidth = 1
//        if let transaction = transactionTemp {
//            //idLabel.text = "Transaction id #\(String(describing: transaction.getInfo().actionId))"
//            var date = Date()
//            let dd = transaction.getInfo()
//            date = dd.actionDate
//            let dateFormater = DateFormatter()
//            dateFormater.dateFormat = "MMMM dd YYYY HH:MM"
//            let dateStr = dateFormater.string(from: date)
//            dateLabel.text =  dateStr
//            if (transaction.getInfo().actionIsIncome) { valueLabel.textColor = UIColor.green } else { valueLabel.textColor = UIColor.red }
//            valueLabel.text = String(transaction.getInfo().actionValue)
//            nameLabel.text = transaction.getInfo().actionName
//            categoryLabel.text =  transaction.getInfo().actionCategory.getInfo().cName
//
//            descriptionTextView.text = transaction.getInfo().actionDescription
//        }
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpView()
    }
    
    func setUpView() {
        if let transaction = transactionTemp {
            //idLabel.text = "Transaction id #\(String(describing: transaction.getInfo().actionId))"
            idLabel.text = "\(transaction.getInfo().actionId)"
            var date = Date()
            let dd = transaction.getInfo()
            date = dd.actionDate
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "MMMM dd YYYY HH:MM"
            let dateStr = dateFormater.string(from: date)
            dateLabel.text =  dateStr
            if (transaction.getInfo().actionIsIncome) { valueLabel.textColor = UIColor.green } else { valueLabel.textColor = UIColor.red }
            valueLabel.text = String(transaction.getInfo().actionValue)
            nameLabel.text = transaction.getInfo().actionName
            categoryLabel.text =  transaction.getInfo().actionCategory.getInfo().cName
            
            descriptionTextView.text = transaction.getInfo().actionDescription
        }
    }
    
    @objc func wayToTransactionEdit() {
        //if let transaction = transactionTemp {
            self.performSegue(withIdentifier: "editTransaction", sender: self)
        //}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTransaction", let nextScene = segue.destination as? CreateEditTransactionViewController, let transactionItem = self.transactionTemp {
            nextScene.record = transactionItem
        }
        
    }
}
