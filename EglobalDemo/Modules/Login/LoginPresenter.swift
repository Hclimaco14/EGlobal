//
//  LoginPresenter.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//  
//

import UIKit

protocol LoginPresentationLogic {
    func presentLoginResponse()
    func presentError(error: RequestError)
}

class LoginPresenter: LoginPresentationLogic {
    
    var view: LoginDisplayLogic?
    
    func presentLoginResponse() {
        view?.displayLoginSuccess()
    }
    
    func presentError(error: RequestError) {
        view?.displayError(error: error)
    }
}
