//
//  RegisterUserPresenter.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//

import UIKit

protocol RegisterUserPresentationLogic {
    func presentRegister(response: String)
    func presentError(error: RequestError)
}

class RegisterUserPresenter: RegisterUserPresentationLogic {
    
    var view: RegisterUserDisplayLogic?
    
    func presentRegister(response: String) {
        view?.displayRegister(response: response.aes128Decrypt())
    }
    
    func presentError(error: RequestError){
        view?.displayError(error: error)
    }
}
