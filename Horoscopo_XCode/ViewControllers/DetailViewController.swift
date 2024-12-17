//
//  DetailViewController.swift
//  Horoscopo_XCode
//
//  Created by Tardes on 13/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscopo: Horoscopo? = nil
    
    var isFavorite: Bool = false
    var session: SessionManager!
    
    @IBOutlet weak var nombreZodiaco: UILabel!
    @IBOutlet weak var iconoZodiaco: UIImageView!
    @IBOutlet weak var lblFechas: UILabel!
    @IBOutlet weak var lblContenido: UITextView!
    @IBOutlet weak var TabTimes: UISegmentedControl!
    @IBOutlet weak var TabDates: UISegmentedControl!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var FavoritoIcon: UIBarButtonItem!
    
    // -----------------------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = SessionManager()
        
        navigationItem.title = horoscopo?.name
        
        iconoZodiaco.image = horoscopo?.icon
        lblFechas.text = horoscopo?.dates
        
        callGetHoroscopo(periodo: periodos[TabTimes.selectedSegmentIndex], Signo: horoscopo!.id, dias: "TODAY")
        
        DatePicker.maximumDate = Date()  // fecha tope -> fecha actual
        
        isFavorite = session.isFavorite(horoscopoId: horoscopo!.id)
        setFavoriteIcon()
    }
    
    @IBAction func TimesControlValueChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        TabDates.isEnabled = (selectedIndex == 0)
        DatePicker.isEnabled = (selectedIndex == 0)
        
        callGetHoroscopo(periodo: periodos[selectedIndex], Signo: horoscopo!.id, dias: "TODAY")
    }
    
//  Manejo de la botonera: Ayer - hoy - mañana ----------------------------------------------------------------------
    
    @IBAction func DatesControlValueChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        callGetHoroscopo(periodo: periodos[TabTimes.selectedSegmentIndex], Signo: horoscopo!.id, dias: dias[selectedIndex])
    }
    
// capturamos la fecha del dataPicker  -----------------------------------------------------------------------------
    
    @IBAction func DatePicker(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: selectedDate)
        
        callGetHoroscopo(periodo: periodos[TabTimes.selectedSegmentIndex], Signo: horoscopo!.id, dias: formattedDate)
        
    }
    
// Activamos el signo como favorito  -------------------------------------------------------------------------------
    
    func setFavoriteIcon() {
        if (isFavorite) {
            FavoritoIcon.image = UIImage(systemName: "heart.fill")
        } else {
            FavoritoIcon.image = UIImage(systemName: "heart")
        }
    }
    
// ---------
    
    @IBAction func setFavorite(_ sender: Any) {
        
        if (isFavorite) {
                session.setFavorite(horoscopoId: "")
        } else {
            session.setFavorite(horoscopoId: horoscopo!.id)
        }
        
        isFavorite = !isFavorite
        setFavoriteIcon()
    }

// ---------------------------------------------------------------------------------------------------------------------
    
    func callGetHoroscopo(periodo: String, Signo: String, dias: String) {
        
        let URL = "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/\(periodo)?sign=\(horoscopo!.id)&day=\(dias)"
        
      //  print(URL)
        
        getHoroscope(Url: URL) { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let apiResponse):
                    self.lblContenido.text = apiResponse.data.horoscope_data
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}


