//
//  UserDefaults+Extension.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 17/09/2022.
//

import Foundation

extension UserDefaults {
    var isUserLoggedIn: Bool {
        get { self.bool(forKey: #function) }
        set { self.setValue(newValue, forKey: #function) }
    }
}
