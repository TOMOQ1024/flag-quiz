//
//  ResultsViewController.swift
//  FlagQuizApp
//
//  Created by 鈴木智久 on 2023/01/28.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    var results: [QResult] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if results.count < 1 {
            return
        }
        resultLabel.text = "\(results.filter{$0.correct}.count) / \(results.count)"
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
