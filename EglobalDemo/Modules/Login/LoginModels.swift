//
//  LoginModels.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//  
//

import UIKit

enum Login {
    struct Request:Codable {
        var user, password: String?
    }
    
    struct Response: Codable {
        var success: Bool
        var token: String?
        
    }
    
    struct ViewModel {
        
    }
    
}
