//
//  SessionManager.swift
//  Horoscopo_XCode
//
//  Created by Tardes on 17/12/24.
//

import Foundation

class SessionManager {
  let defaults = UserDefaults.standard
  
  func setFavorite(horoscopoId: String) {
      defaults.set(horoscopoId, forKey: "favorite_horoscopo")
  }

  func getFavorite() -> String {
      return defaults.string(forKey: "favorite_horoscopo") ?? ""
  }

  func isFavorite(horoscopoId: String) -> Bool {
      return horoscopoId == getFavorite()
  }
}
