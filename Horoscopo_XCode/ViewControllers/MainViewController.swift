//
//  ViewController.swift
//  Horoscopo_XCode
//
//  Created by Tardes on 12/12/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource , UISearchBarDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    
    var HoroscopoList: [Horoscopo] = Horoscopo.getAll()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        
     // Mostrar la opción de búsqueda en la barra de título --------------------------------
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
 // ONRESUME --------------------------------------------------------------------------------
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TableView.reloadData()   // Redibujamos las celdas
    }

 // -----------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HoroscopoList.count
    }
    
// ---------------------------------------------------------------------------------------------
    
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
    
//  Búsqueda en la barra de Título -------------------------------------------------------------------------------
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if (searchText.isEmpty) {
                HoroscopoList = Horoscopo.getAll()
            } else {
                HoroscopoList = Horoscopo.getAll().filter({ horoscope in
                    horoscope.name.range(of: searchText, options: .caseInsensitive) != nil
                })
            }
            TableView.reloadData()
    }
        
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            HoroscopoList = Horoscopo.getAll()
            TableView.reloadData()
    }
    
    
    
}

