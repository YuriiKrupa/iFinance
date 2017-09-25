//
//  ChartViewController.swift
//  iFinance
//
//  Created by ITA student on 9/25/17.
//  Copyright © 2017 Yurii Kupa. All rights reserved.
//

import Foundation
import Charts

class ChartViewController: UIViewController {
    
    let model = TransferModel.transferModel
    
    var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        var dataStr = [String]()
        var dataValue = [Double]()
        for i in model.getTransactionList() {
            if !dataStr.contains(i.getCagegory().getInfo().cName) { dataStr.append(i.getCagegory().getInfo().cName)
                dataValue.append(i.getValue())
            } else {
                dataValue[dataStr.index(of: i.getCagegory().getInfo().cName)!] += i.getValue()
            }
        }
        
        pieChartView = PieChartView(frame: self.view.bounds)
        self.view.addSubview(pieChartView!)
        setChart(dataPoints: dataStr, values: dataValue)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry1 = PieChartDataEntry(value: values[i], label: dataPoints[i])
            dataEntries.append(dataEntry1)
        }
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Units Sold")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        pieChartDataSet.colors = colors
    }
}
