//
//  ViewController.swift
//  SearchBar
//
//  Created by indo gusmas arung samudra on 28/02/19.
//  Copyright © 2019 indo gusmas arung samudra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var countryNameArray = ["Indonesia", "Jepang","Belanda","Spanyol","Malaysia","Singapura","Thailand","Kamboja"]
    
    var searchCountry = [String]()
    var searching = false
    
    
    
    
    @IBOutlet weak var serchView: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchCountry.count
        }else {
        return countryNameArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching{
            cell?.textLabel?.text = searchCountry[indexPath.row]
        }else{
            cell?.textLabel?.text = countryNameArray[indexPath.row]
        }
        
        return cell!
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCountry = countryNameArray.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}












