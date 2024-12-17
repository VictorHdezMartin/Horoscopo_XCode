//
//  Horoscopo.swift
//  Horoscopo_XCode
//
//  Created by Tardes on 12/12/24.
//

import Foundation
import UIKit

struct Horoscopo {
    
    let id: String
    let name: String
    let icon: UIImage
    let dates: String
    
    static func getAll() -> [Horoscopo] {
        let list = [
            Horoscopo(id: "Aries", name: "Aries", icon: UIImage(named: "Iconos_Horoscopo/icon_aries")!, dates: "marzo 21 ~ abril 19"),
            Horoscopo(id: "Taurus", name: "Tauro", icon: UIImage(named: "Iconos_Horoscopo/icon_tauro")!, dates: "abril 20 ~ mayo 20"),
            Horoscopo(id: "Gemini", name: "Géminis", icon: UIImage(named: "Iconos_Horoscopo/icon_geminis")!, dates: "mayo 21 ~ junio 20"),
            Horoscopo(id: "Cancer", name: "Cancer", icon: UIImage(named: "Iconos_Horoscopo/icon_cancer")!, dates: "junio 21 ~ julio 22"),
            Horoscopo(id: "Leo", name: "Leo", icon: UIImage(named: "Iconos_Horoscopo/icon_leo")!, dates: "julio 23 ~ agosto 22"),
            Horoscopo(id: "Virgo", name: "Virgo", icon: UIImage(named: "Iconos_Horoscopo/icon_virgo")!, dates: "agosto 23 ~ septiembre 22"),
            Horoscopo(id: "Libra", name: "Libra", icon: UIImage(named: "Iconos_Horoscopo/icon_libra")!, dates: "septiembre 23 ~ octubre 22"),
            Horoscopo(id: "Scorpio", name: "Escorpio", icon: UIImage(named: "Iconos_Horoscopo/icon_escorpio")!, dates: "octubre 23 ~ noviembre 21"),
            Horoscopo(id: "Sagittarius", name: "Sagitario", icon: UIImage(named: "Iconos_Horoscopo/icon_sagitario")!, dates: "noviembre 22 ~ diciembre 21"),
            Horoscopo(id: "Capricorn", name: "Capricornio", icon: UIImage(named: "Iconos_Horoscopo/icon_capricornio")!, dates: "diciembre 22 ~ enero 19"),
            Horoscopo(id: "Aquarius", name: "Acuario", icon: UIImage(named: "Iconos_Horoscopo/icon_acuario")!, dates: "enero 20 ~ febrero 18"),
            Horoscopo(id: "Pisces", name: "Piscis", icon: UIImage(named: "Iconos_Horoscopo/icon_piscis")!, dates: "febrero 19 ~ marzo 20"),
        ]
    return list
    }
}

// --------------------------------------------------------------------------------------


// URL API Horoscopo
//  "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/$periodo?sign=${horoscope.id}&day=TODAY"
//  "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=aries&day=TODAY"










