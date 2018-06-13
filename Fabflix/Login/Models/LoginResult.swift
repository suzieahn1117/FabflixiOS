//
//  LoginResult.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/10/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import Foundation

class LoginResult: WebCallProtocol
{
    
    let customerId : Int
    let responseCode : Int
    let responseMessage : String
    required init(json: [String : Any]) throws
    {
        guard let cID = json["customerId"] as? Int
        else
        {
            let customError : Error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "customer id not found"])
            throw customError
        }
        
        guard let code = json["responseCode"] as? Int
            else
        {
            let customError : Error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "customer id not found"])
            throw customError
        }
        
        guard let message = json["responseMessage"] as? String
            else
        {
            let customError : Error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "customer id not found"])
            throw customError
        }
        
        customerId = cID
        responseCode = code
        responseMessage = message
        
    }
}
