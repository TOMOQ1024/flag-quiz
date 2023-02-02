//
//  ResultClass.swift
//  FlagQuizApp
//
//  Created by 鈴木智久 on 2023/02/02.
//

import Foundation

class QResult {
    var id: Int
    var correct: Bool
    
    init(_ id: Int, _ correct: Bool) {
        self.id = id
        self.correct = correct
    }
}
