//
//  ViewController.swift
//  Horoscopo_XCode
//
//  Created by Tardes on 12/12/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource , UISearchBarDelegate {
    
    // MARCK: Outlets
    
    @IBOutlet weak var TableView: UITableView!
    
    let HoroscopoList: [Horoscopo] = Horoscopo.getAll()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        
    // barra de búsqueda
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HoroscopoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Horoscopo__TblViewCell
        
        let horoscopo = HoroscopoList[indexPath.row]
        
        cell.render(horoscopo)
        return cell
    }
    
// movernos a otro ViewController pasando parámetros -------------------------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "navigateToDetail") {
            
            let detailViewControler = segue.destination as! DetailViewController
            let IndexPath = TableView.indexPathForSelectedRow!
            let horoscopo = HoroscopoList[IndexPath.row]
            detailViewControler.horoscopo = horoscopo
            
            TableView.deselectRow(at: IndexPath, animated: true)  // deseleccionamos la celda
        }
    }
    
// ---------------------------------------------------------------------------------------------
    
    
    
    
    
    
}

