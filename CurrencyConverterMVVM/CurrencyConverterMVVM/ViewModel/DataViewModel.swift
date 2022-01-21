//
//  DataViewModel.swift
//  CurrencyConverterMVVM
//
//  Created by Gülzade Karataş on 21.01.2022.
//

import Foundation

struct DataViewModel {
    let currencyMyData : DataModel

    func getCurrencyMyList() -> CurrencyListViewModel {
        var currencyList = [Currency]() //dictionary oluşturuyoruz key value
        for currency in self.currencyMyData.rates { // Listeye ratesleri ekliyoruz
            print(currency)
            currencyList.append(Currency(currencyName: currency.key, price: currency.value))
        }
        return CurrencyListViewModel(currencyList: currencyList)
    }

}
