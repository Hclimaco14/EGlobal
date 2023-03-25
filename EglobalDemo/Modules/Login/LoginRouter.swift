//
//  LoginRouter.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//  
//


import UIKit

protocol LoginRoutingLogic {
    func routeToMenu()
}

class LoginRouter: LoginRoutingLogic {
    
    var view: LoginViewController?
    
    func routeToMenu() {
        DispatchQueue.main.async {
            let vc = MenuViewController()
            self.view?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
