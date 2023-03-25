//
//  DevicesInteractor.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//


import Foundation


protocol DevicesBusinessLogic {
    func doSomething(request: Devices.Something.Request)
}

class DevicesInteractor:  DevicesBusinessLogic {
    
    var presenter: DevicesPresentationLogic?
    
    let worker = DevicesWorker()
    
    func doSomething(request: Devices.Something.Request) {
        let response = Devices.Something.Response()
        presenter?.presentSomething(response: response)
    }
    
}
