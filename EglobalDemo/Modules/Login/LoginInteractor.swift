//
//  LoginInteractor.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//  
//


import Foundation


protocol LoginBusinessLogic {
    func getLogin(user: String?, password: String?)
}

class LoginInteractor:  LoginBusinessLogic {
    
    var presenter: LoginPresentationLogic?
    
    let worker = LoginWorker()
    
    func getLogin(user: String?, password: String?) {
        
        worker.getLoginRequest(login: Login.Request(user: user, password: password)) { result in
            switch result {
            case .success(let response):
                if let token  = response.token {
                    SessionManager.setToken(key: token)
                    self.presenter?.presentLoginResponse()
                }
            case .failure(let failure):
                self.presenter?.presentError(error: failure)
            }
            
        }
    }
    
}
