//
//  LoginRepository.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/10/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import Foundation

class LoginRepository: NSObject, URLSessionTaskDelegate
{
    static var loginWrap = LoginRepository()
    
    //let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    override init()
    {
        super.init()
    }
    
     func postLogin(username: String, password: String, completionHandler: @escaping basicWebCall<LoginResult>){
        
        
        let urlComponents = String(format: "https://fabflix-122b.appspot.com/API/Login")
       
        guard let url = URL(string:urlComponents) else{return}
        let parameter = ["username":username, "password":password]
        
       
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else{
            return
        }
        
        request.httpBody = httpBody
        
  
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession(configuration: .ephemeral, delegate: self, delegateQueue: nil)
        session.dataTask(with: request){ (data, response, error) in

            print(response ?? "")
            if error != nil
            {
             
                print (error!)
                completionHandler(false, nil, error!)
                return
            }
            
            do {
             
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print("success but")
                    if let dictionaryOutput = json as? [String : Any]
                    {
                        let lr = try LoginResult(json: dictionaryOutput)
                         print(json)
                        
                        completionHandler(true, lr, nil)
                        
                    }
                    else
                    {
                        let customError : Error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't parse jsonDictionary"])
                        completionHandler(false, nil, customError)

                    }
                
                
            }catch
            {
                completionHandler(false, nil,error)
            }
        }.resume()
        

        
    }
    

}
