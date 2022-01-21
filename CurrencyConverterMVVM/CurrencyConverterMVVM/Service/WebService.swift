//
//  WebService.swift
//  CurrencyConverterMVVM
//
//  Created by Gülzade Karataş on 21.01.2022.
//

import Foundation

class WebService {
    
    //gerçekten tamamlanmasını bekliyorsak sonunda bir şey dondurmek ıstıyorsak bunun için escaping kullanmak mantıklıdır.
    //netten veri çekiyor ve döndürcekseniz escaping kullanmalısınız.
    
    func downloadCurrencies(url: URL, completion: @escaping(DataModel?) -> ()) {
   print("web service")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                let curencyData = try? JSONDecoder().decode(DataModel.self, from: data)
                //jsondecoder json formatndaki veriyi işlemeye decode etmeye veriye donusurmeye yarar. bİze bir protocol sorar bide datayı sorar. Decodeble protocolumuz //CurrencyConverter
                
                if let curencyData = curencyData {
                    completion(curencyData) //optionaldan cıkarmıak için if let içinde kullandık
                    print(curencyData.rates)
                }
            }
        }.resume() //işlemi başlatmamıza yarayan yöntem
        
    }
}
