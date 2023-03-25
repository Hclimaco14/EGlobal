//
//  MenuRouter.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//  
//


import UIKit

protocol MenuRoutingLogic {
    func routeToDevices()
    func routeToRegister()
    func routeToListUser()
}

class MenuRouter: MenuRoutingLogic {
    
    var view: MenuViewController?
    
    func routeToDevices() {
        DispatchQueue.main.async {
            let vc = DevicesViewController()
            self.view?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func routeToRegister() {
        DispatchQueue.main.async {
            let vc = RegisterUserViewController()
            self.view?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func routeToListUser() {
        DispatchQueue.main.async {
            let vc = RegisterListViewController()
            self.view?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
