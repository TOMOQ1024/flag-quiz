//
//  QuestionClass.swift
//  FlagQuizApp
//
//  Created by 鈴木智久 on 2023/01/29.
//

import Foundation

// Usage:
// q = Question(問題数, エリア:["As":true,...])
// q.create() → 問題の作成
// q.options → 選択肢となる国のid配列
// q.answer → 正解の番号(0...3)取得
// q.submit(i) → 回答番号(0...3)
// r = q.result → 結果の取得．
// q.resultsの型は未定
class Question {
    var count: Int
    var current: Int
    var candidates: [Int]// ここからランダムに4つ選び，正解を設定することで問題を作成する
    var answer: Int
    var options: [Int]
    var qresults: [QResult]
    init(_ count: Int, _ areas: [String:Bool]) {
        self.count = count
        self.current = 0
        self.candidates = []
        for c in countries {
            if areas[c.key] ?? false {
                for i in c.value {
                    self.candidates.append(i.id)
                }
            }
        }
        self.answer = 0
        self.options = []
        self.qresults = []
    }
    
    func create(){
        // self.options作成
        self.options = []
        self.current += 1
        for _ in 0..<4 {
            self.options.append(self.candidates.randomElement()!)
        }
        // self.answer設定
        self.answer = Int.random(in: 0..<4)
    }
    
    func submit(_ id:Int) {
        // id: 1...4
        // resultの更新
        print(self.answer == id)
        qresults.append(QResult(
            self.options[self.answer],
            self.answer == id)
        )
    }
}
