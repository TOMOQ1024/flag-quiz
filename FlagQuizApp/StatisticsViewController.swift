//
//  StatisticsViewController.swift
//  FlagQuizApp
//
//  Created by 東光邦 on 2023/02/01.
//

import UIKit
import Charts

class StatisticsViewController: UIViewController {
    
    //<testdata>
    let result = [
        "count": 10,
        "correct": 6,
        "hiScore": 2000
    ]
    //</testdata>
    
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    @IBOutlet weak var hiScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //<円グラフの設定>
        let correctRate = Double(result["correct"]!) / Double(result["count"]!) * 100
        self.pieChartView.centerText = String(result["correct"]!) + "/" + String(result["count"]!)
        
        let dataEntries = [
            PieChartDataEntry(value: correctRate, label: ""),
            PieChartDataEntry(value: 100-correctRate, label: "")
        ]
        
        let dataSet = PieChartDataSet(entries: dataEntries, label: "testdata")
        dataSet.colors = ChartColorTemplates.material()
        dataSet.valueTextColor = UIColor.black
        dataSet.entryLabelColor = UIColor.black
        self.pieChartView.data = PieChartData(dataSet: dataSet)
        //</円グラフの設定>
        hiScore.text = String(result["hiScore"]!)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
