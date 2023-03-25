//
//  RegisterListInteractor.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//


import Foundation


protocol RegisterListBusinessLogic {
    func deleteUser(user: RegisterUser.ViewModel)
}

class RegisterListInteractor:  RegisterListBusinessLogic {
    
    var presenter: RegisterListPresentationLogic?
    
    let worker = RegisterListWorker()
    
    func deleteUser(user: RegisterUser.ViewModel) {
        worker.deleteUser(user: user)
    }
    
}
