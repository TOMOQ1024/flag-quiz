//
//  ViewController.swift
//  FlagQuizApp
//
//  Created by 鈴木智久 on 2023/01/28.
//

import UIKit

// グローバル変数宣言
var countries: [String:[Country]] = [:]
var areaFlg: [String:Bool] = [:]

class ViewController: UIViewController {
    
    var csvLines = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // CSVファイルを読み込み，countries変数を初期化する
        loadCSV(fileName: "Countries")
        for i in 0..<csvLines.count {
            let line = csvLines[i].components(separatedBy: ",")
            let newCountry = Country(i,line[0],line[1])
            
            if !countries.keys.contains(newCountry.area) {
                countries[newCountry.area] = []
            }
            countries[newCountry.area]?.append(newCountry)
        }
        
        print("test question:")
        for a in countries {
            if !(areaFlg[a.key] ?? false) {
                areaFlg[a.key] = true
            }
        }
    }

    func loadCSV(fileName: String){
        csvLines = [String]()

        guard let path = Bundle.main.path(forResource:fileName, ofType:"csv") else {
            print("csvファイルがないよ")
            return
        }

        do {
            let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            csvLines = csvString.split(whereSeparator: \.isNewline).map{String($0)}
            csvLines.removeLast()
        } catch let error as NSError {
            print("エラー: \(error)")
        }
    }

}

