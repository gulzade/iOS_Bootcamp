//
//  ViewController.swift
//  CurrencyConverterMVVM
//
//  Created by Gülzade Karataş on 20.01.2022.
//

import UIKit

class ViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    private var currencyListViewModel: CurrencyListViewModel!
    private var dataViewModel: DataViewModel!
    var colorArray = [UIColor]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        self.colorArray = [
            UIColor(red: 205/255, green: 145/255, blue: 158/255, alpha: 1.0),
            UIColor(red: 255/255, green: 187/255, blue: 255/255, alpha: 1.0),
            UIColor(red: 219/255, green: 112/255, blue: 147/255, alpha: 1.0),
            UIColor(red: 255/255, green: 181/255, blue: 197/255, alpha: 1.0),
            UIColor(red: 205/255, green: 105/255, blue:201/255, alpha: 1.0),
            UIColor(red: 238/255, green: 169/255, blue: 184/255, alpha: 1.0),
          
        ]
        
        getData()
    }

    func getData(){
        print("urllll")
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=ac7bf197a45600a4f0fc9cfed89dd49b")!
        WebService().downloadCurrencies(url: url) { (currencyMyData) in
            if let currencyMyData = currencyMyData {
                print(currencyMyData)
                print("-------")
                self.dataViewModel = DataViewModel(currencyMyData: currencyMyData)
                self.currencyListViewModel = self.dataViewModel.getCurrencyMyList()
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("row")
        return self.currencyListViewModel == nil ? 0 : self.currencyListViewModel.numberOfRowsInSection()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyTableViewCell
        let currencyViewModel =  self.currencyListViewModel.currencyAtIndex(indexPath.row)
        print("-------cell")
            cell.priceTextLabel.text = String(currencyViewModel.price)
            cell.ratesTextLabel.text = currencyViewModel.name
            cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }
}

