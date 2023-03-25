//
//  UserDefaultManager.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//

import Foundation
class UserDefaultsManager {
    static let keyLastAppClose = "lastAppClose"
    class var lastAppClose: Double {
        get {
            let value: Double? = UserDefaults.standard.double(forKey: UserDefaultsManager.keyLastAppClose)
        
            if value != nil {
                return value!
            }
                return 0
            }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsManager.keyLastAppClose)
            UserDefaults.standard.synchronize()
        }
    }
}
