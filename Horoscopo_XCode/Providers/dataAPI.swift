//
//  dataAPI.swift
//  Horoscopo_XCode
//
//  Created by Tardes on 17/12/24.
//

import Foundation

// Estructura para manejar la respuesta de la API ----------------------------------------------------
 
    struct ResponseAPI: Decodable {
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

// lista de opciones de selección  ----------------------------------------------------------------------------------

   let periodos: [String] = ["daily", "weekly", "monthly"]
   let dias: [String] = ["YESTERDAY", "TODAY", "TOMORROW"]

