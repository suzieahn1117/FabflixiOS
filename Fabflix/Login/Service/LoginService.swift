//
//  LoginService.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/10/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import Foundation

class LoginService{
    static func Login(username: String, password: String, completionHandler: @escaping basicWebCall<LoginResult> )
    {
        //var result: LoginResult;
        //completionHandler(true, result);
        LoginRepository.loginWrap.postLogin(username: username, password: password, completionHandler: completionHandler)
        
    }
}
