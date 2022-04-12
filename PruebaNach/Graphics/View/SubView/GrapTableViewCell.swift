//
//  GrapTableViewCell.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import UIKit
import Charts

class GrapTableViewCell: UITableViewCell, ChartViewDelegate {
    var titleLabel = UILabel()
    var pieChart = PieChartView()
    var question : Question?

    init(question : Question){
        self.question = question
        super.init(style: .default, reuseIdentifier: nil)
        self.backgroundColor = .white
        initUI()
    }
    
    
    func initUI(){
        titleLabel.text = question?.text
        titleLabel.font = UIFont(name: "Helvetica", size: 20)
        titleLabel.textColor = colorBlu
        titleLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(titleLabel)
        titleLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: nil, left: 20, top: 10, right: 20, bottom: nil)
                
        pieChart.delegate = self
        self.addSubview(pieChart)
        pieChart.addAnchorsAndCenter(centerX: true, centerY: false, width: 250, height: 250, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top,relativeToView: titleLabel)

        var dataEntries = [PieChartDataEntry]()
        if let entries = question?.chartData{
            for data in entries{
                let dataEntry = PieChartDataEntry(value: Double(data.percetnage!), label: data.text, data: data.text as AnyObject)
                dataEntries.append(dataEntry)
            }
        }
        

        let set1 = PieChartDataSet(entries: dataEntries,label: "" )
       
        var  colors: [UIColor] = []
        for _ in 0...7 {
          let red = Double(arc4random_uniform(256))
          let green = Double(arc4random_uniform(256))
          let blue = Double(arc4random_uniform(256))
          let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
          colors.append(color)
        }
        
            set1.colors = colors
       
        let data = PieChartData(dataSet: set1)
            pieChart.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
