//
//  ReportViewController.swift
//  iFinance
//
//  Created by ITA student on 10/6/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import UIKit
import Charts

class ReportViewController: UIViewController {
    
    @IBOutlet weak var segmentedTypeState: UISegmentedControl!
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    @IBOutlet weak var chartAreaSubView: UIView!
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(testing))
    }
    
    @IBAction func segmentedTypeControl(_ sender: Any) {
        if !(segmentedTypeState.selectedSegmentIndex == 4) {
            startDatePicker.isHidden = true
            endDatePicker.isHidden = true
        } else {
            startDatePicker.isHidden = false
            endDatePicker.isHidden = false
        }
    }
    
    @objc func testing(){
        print(String(describing: startDatePicker.date))
        print(String(describing: endDatePicker.date))
    }
}
