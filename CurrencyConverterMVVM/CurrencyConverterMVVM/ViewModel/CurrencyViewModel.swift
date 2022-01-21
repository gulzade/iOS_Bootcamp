//
//  CurrencyViewModel.swift
//  CurrencyConverterMVVM
//
//  Created by Gülzade Karataş on 21.01.2022.
//

import Foundation
struct CurrencyListViewModel {
    let currencyList : [Currency]
 
    func numberOfRowsInSection() -> Int {
        print(currencyList)
        return self.currencyList.count
    }
    func currencyAtIndex(_ index : Int) -> CurrencyViewModel { //CurrencyViewModel ile birbirine bağlamak için
        let currency = self.currencyList[index]
        return CurrencyViewModel(curcency: currency)
    }
}
    
struct CurrencyViewModel {
        let curcency : Currency
        
        var name : String {
            return self.curcency.currencyName
        }
        var price : Double {
            return self.curcency.price
            
        }
        
    }


