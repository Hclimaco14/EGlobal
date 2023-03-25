//
//  MenuInteractor.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//  
//


import Foundation


protocol MenuBusinessLogic {
    func doSomething(request: Menu.Something.Request)
}

class MenuInteractor:  MenuBusinessLogic {
    
    var presenter: MenuPresentationLogic?
    
    let worker = MenuWorker()
    
    func doSomething(request: Menu.Something.Request) {
        let response = Menu.Something.Response()
        presenter?.presentSomething(response: response)
    }
    
}
