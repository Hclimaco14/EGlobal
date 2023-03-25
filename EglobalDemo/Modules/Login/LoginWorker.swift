//
//  LoginWorker.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//  
//

import UIKit

class LoginWorker {
   
    private let serviceMager: ServiceMaganerProtocol
    
    public init(serviceManager: ServiceMaganerProtocol = ServicesManager()) {
        self.serviceMager = serviceManager
    }
    
    
    func getLoginRequest(login: Login.Request, result: @escaping(Result<Login.Response, RequestError>) -> Void) {
        
        guard let request = NetworkUtils.createRequest(urlStr: "/getLogin",
                                                       method: .post,
                                                       body: login) else { return }
        
        serviceMager.fetchRequest(with: request, completion: result)
    }
    
}
