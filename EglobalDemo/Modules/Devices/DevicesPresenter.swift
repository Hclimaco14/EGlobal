//
//  DevicesPresenter.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//

import UIKit

protocol DevicesPresentationLogic {
    func presentSomething(response: Devices.Something.Response)
}

class DevicesPresenter: DevicesPresentationLogic {
    
    var view: DevicesDisplayLogic?
    
    func presentSomething(response: Devices.Something.Response) {
        let viewModel = Devices.Something.ViewModel()
        view?.displaySomething(viewModel: viewModel)
    }
}
