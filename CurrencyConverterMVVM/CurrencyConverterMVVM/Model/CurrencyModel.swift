//
//  CurrencyModel.swift
//  CurrencyConverterMVVM
//
//  Created by Gülzade Karataş on 21.01.2022.
//

import Foundation

struct Currency : Decodable { 
    let currencyName : String
    let price : Double
}
