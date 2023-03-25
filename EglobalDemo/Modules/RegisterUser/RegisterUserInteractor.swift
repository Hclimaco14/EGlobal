//
//  RegisterUserInteractor.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//


import Foundation


protocol RegisterUserBusinessLogic {
    func registerUser(firstName: String?, lastName: String?, age:Int?)
}

class RegisterUserInteractor:  RegisterUserBusinessLogic {
    
    var presenter: RegisterUserPresentationLogic?
    
    let worker = RegisterUserWorker()
    
    func registerUser(firstName: String?, lastName: String?, age:Int?) {
        let request = RegisterUser.Request(firstName: firstName, lastName: lastName, age: age)
        worker.registerUser(register: request) { result in
            switch result {
            case .success(let response):
                if response.success {
                    self.presenter?.presentRegister(response: response.key ?? "")
                    CoreDataManager.shared.saveUser(user: response)
                }
                break
            case .failure(let failure):
                self.presenter?.presentError(error: failure)
                break
            }
        }
    }
    
}
