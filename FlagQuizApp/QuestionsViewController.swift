//
//  QuestionsViewController.swift
//  FlagQuizApp
//
//  Created by 鈴木智久 on 2023/01/29.
//

import UIKit

class QuestionsViewController: UIViewController {
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var submitButton1: UIButton!
    @IBOutlet weak var submitButton2: UIButton!
    @IBOutlet weak var submitButton3: UIButton!
    @IBOutlet weak var submitButton4: UIButton!
    
    var q: Question!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定の適用
        // これらの引数はSettingsViewControllerから持ってくる
        q = Question(2, areaFlg)
        print("test question:")
        proceed()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultsVC = segue.destination as! ResultsViewController
        resultsVC.results = q.qresults
    }
    
    @IBAction func btnAction(sender: UIButton) {
        // print(sender.tag)
        q.submit(sender.tag)
        proceed()
    }
    
    func displayQuestion(){
        var c = Country.getCountryById(q.options[q.answer])
        questionImage.image = UIImage(
            named: c.imgSrc
        )
        c = Country.getCountryById(q.options[0])
        submitButton1.setTitle("1. \(c.name)", for: .normal)
        c = Country.getCountryById(q.options[1])
        submitButton2.setTitle("2. \(c.name)", for: .normal)
        c = Country.getCountryById(q.options[2])
        submitButton3.setTitle("3. \(c.name)", for: .normal)
        c = Country.getCountryById(q.options[3])
        submitButton4.setTitle("4. \(c.name)", for: .normal)
    }
    
    func proceed(){
        if q.current >= q.count {
            // ここでResultViewControllerへ画面遷移する
            self.performSegue(withIdentifier: "QuestionExit", sender: nil)
            return;
        }
        q.create()
        print("---Question Created---")
        print("Question \(q.current)/\(q.count)")
        print("Candidates:")
        print(q.options.map{Country.getCountryById($0).name})
        print("Answer Number(1...4): ")
        print(q.answer+1)
        displayQuestion()
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
