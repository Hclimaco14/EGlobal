//
//  RegisterUserModels.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//

import UIKit

enum RegisterUser {
    
    struct Request:Codable {
            var firstName: String?
            var lastName: String?
            var age: Int?
        }
    
    struct Response:Codable {
        var success: Bool
        var key: String?
        var firstName: String?
        var lastName: String?
        var age: String?
    }
    
    struct ViewModel:Codable {
        var uuid: String
        var firstName: String?
        var lastName: String?
        var age: String?
    }
}
