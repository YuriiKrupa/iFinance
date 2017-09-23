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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(wayToTransactionEdit))
        
        //TODO: finish editing feathure
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        descriptionTextView.layer.borderWidth = 1
        if let transaction = transactionTemp {
            idLabel.text = "Transaction id #\(String(describing: transaction.getInfo().actionId))"
            var date = Date()
            let dd = transaction.getInfo()
            date = dd.actionDate
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "MMMM dd YYYY HH:MM"
            let dateStr = dateFormater.string(from: date)
            dateLabel.text =  dateStr
            if (transaction.getInfo().actionIsIncome) { valueLabel.textColor = UIColor.green } else { valueLabel.textColor = UIColor.red }
            valueLabel.text = "\(String(describing: transaction.getInfo().actionValue))"
            nameLabel.text = "\(String(describing: transaction.getInfo().actionName))"
            categoryLabel.text = "\(String(describing: transaction.getInfo().actionCategory.getInfo().cName))"

            descriptionTextView.text = "\(String(describing: transaction.getInfo().actionDescription))"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc func wayToTransactionEdit() {
        self.performSegue(withIdentifier: "editTransaction", sender: self)
    }
}
