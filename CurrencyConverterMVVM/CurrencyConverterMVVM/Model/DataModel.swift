//
//  DataModel.swift
//  CurrencyConverterMVVM
//
//  Created by Gülzade Karataş on 21.01.2022.
//

import Foundation
struct  DataModel: Decodable { //json formatındali değerler iççin model
    let success : Bool
    let timestamp : Int
    let base : String
    let date : String
    let rates : [String : Double] //Dictionary formatında
}
