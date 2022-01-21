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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
        
        return cell
    }
}

