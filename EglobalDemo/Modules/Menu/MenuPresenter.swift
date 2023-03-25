//
//  MenuPresenter.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//  
//

import UIKit

protocol MenuPresentationLogic {
    func presentSomething(response: Menu.Something.Response)
}

class MenuPresenter: MenuPresentationLogic {
    
    var view: MenuDisplayLogic?
    
    func presentSomething(response: Menu.Something.Response) {
        let viewModel = Menu.Something.ViewModel()
        view?.displaySomething(viewModel: viewModel)
    }
}
