//
//  RegisterUserWorker.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//

import UIKit

class RegisterUserWorker {
    
    private let serviceMager: ServiceMaganerProtocol
    
    public init(serviceManager: ServiceMaganerProtocol = ServicesManager()) {
        self.serviceMager = serviceManager
    }
    
    
    func registerUser(register: RegisterUser.Request, result: @escaping(Result<RegisterUser.Response, RequestError>) -> Void) {
        
        guard let request = NetworkUtils.createRequest(urlStr: "/addUser",
                                                       method: .post,
                                                       body: register) else {
            return result(.failure(RequestError(success: false,
                                                statusCode: 403,
                                                statusMessage: "Error in make request")))
            
        }
        
        serviceMager.fetchRequest(with: request, completion: result)
    }
    
}
