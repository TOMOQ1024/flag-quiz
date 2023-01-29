//
//  CountryClass.swift
//  FlagQuizApp
//
//  Created by 鈴木智久 on 2023/01/29.
//

import Foundation

class County {
    var id: Int
    var name: String
    var area: String
    var imgSrc: String
    
    init(id:Int, name:String, area:String){
        self.id = id
        self.name = name
        self.area = area
        self.imgSrc = "Flags/flag\(String(format: "%03d", id))"
        print(self.imgSrc)
    }
}
