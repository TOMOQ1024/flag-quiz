//
//  CountryClass.swift
//  FlagQuizApp
//
//  Created by 鈴木智久 on 2023/01/29.
//

import Foundation

class Country {
    var id: Int
    var name: String
    var area: String
    var imgSrc: String
    
    init(_ id:Int, _ name:String, _ area:String){
        self.id = id + 1
        self.name = name
        self.area = area
        self.imgSrc = "Flags/flag\(String(format: "%03d", id + 1))"
    }
}
