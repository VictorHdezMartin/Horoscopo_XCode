//
//  DetailViewController.swift
//  Horoscopo_XCode
//
//  Created by Tardes on 13/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscopo: Horoscopo? = nil
    
    @IBOutlet weak var nombreZodiaco: UILabel!
    @IBOutlet weak var iconoZodiaco: UIImageView!
    @IBOutlet weak var lblFechas: UILabel!
    @IBOutlet weak var lblContenido: UITextView!
    @IBOutlet weak var TabTimes: UISegmentedControl!
    @IBOutlet weak var TabDates: UISegmentedControl!
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    // -----------------------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = horoscopo?.name
        
        iconoZodiaco.image = horoscopo?.icon
        lblFechas.text = horoscopo?.dates
        
        callGetHoroscopo(periodo: periodos[TabTimes.selectedSegmentIndex], Signo: horoscopo!.id, dias: "TODAY")
    }
    
    @IBAction func TimesControlValueChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        if (selectedIndex == 0) {
            TabDates.isHidden = false
            DatePicker.isHidden = false
        } else{
            TabDates.isHidden = true
            DatePicker.isHidden = true
        }
        
        callGetHoroscopo(periodo: periodos[selectedIndex], Signo: horoscopo!.id, dias: "TODAY")
    }
    
// ---------------------------------------------------------------------------------------------------------------------
    
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

    
// ---------------------------------------------------------------------------------------------------------------------
    
    func callGetHoroscopo(periodo: String, Signo: String, dias: String) {
        
        let URL = "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/\(periodo)?sign=\(horoscopo!.id)&day=\(dias)"
        print(URL)
        getHoroscope(Url: URL) { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let horoscopeResponse):
                    self.lblContenido.text = horoscopeResponse.data.horoscope_data
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

// lista de opciones de selección  ----------------------------------------------------------------------------------

   let periodos: [String] = ["daily", "weekly", "monthly"]
   let dias: [String] = ["YESTERDAY", "TODAY", "TOMORROW"]

// Estructura para manejar la respuesta de la API -------------------------------------------------------------------
    
    struct HoroscopeResponse: Decodable {
        let data: HoroscopeData
        let status: Int
        let success: Bool
    }

    struct HoroscopeData: Decodable {
        let date: String?
        let week: String?
        let month: String?
        let horoscope_data: String
    }

