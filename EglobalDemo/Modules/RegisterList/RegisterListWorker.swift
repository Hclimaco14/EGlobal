//
//  RegisterListWorker.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//

import UIKit

class RegisterListWorker {
    
    func deleteUser(user: RegisterUser.ViewModel) {
        CoreDataManager.shared.deleteUser(user: user)
    }
    
}
