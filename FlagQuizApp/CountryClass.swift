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
    
    static var voidCountry = Country(0,"void","Vd")
    
    init(_ id:Int, _ name:String, _ area:String){
        self.id = id + 1
        self.name = name
        self.area = area
        self.imgSrc = "flag\(String(format: "%03d", id + 1))"
    }
    
    static func getCountryById(_ id: Int) -> Country{
        for C in countries {
            for c in C.value {
                if c.id == id {
                    return c
                }
            }
        }
        return Country.voidCountry
    }
}
