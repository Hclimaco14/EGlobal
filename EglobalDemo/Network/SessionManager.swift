//
//  SessionManager.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//

import Foundation

class SessionManager {
    
    private static let shared = SessionManager()
    
    private var token = "942687be509bf10e4426a95f3a8210bb54000027"

    static var AESencryptKey:String { return "a5e5208cafbc0a46e97489e936c98db8" }

    class func setToken(key: String) {
        self.shared.token = key
    }
    
    class func getToken() -> String {
        return self.shared.token
    }
    
}
