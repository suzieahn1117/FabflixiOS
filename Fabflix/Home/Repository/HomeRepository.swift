//
//  HomeRepository.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/12/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import Foundation


class HomeRepository: NSObject, URLSessionTaskDelegate
{
    static var searchwrap = HomeRepository()
    
 
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    override init()
    {
        super.init()
    }
    
    func getSearchResults(search_key: String, completionHandler: @escaping basicWebCall<SearchResult>)
    {
        dataTask?.cancel()
        
        let urlComponents=String(format: "https://fabflix-122b.appspot.com/API/Search?search_key=\(search_key)")
            
        guard let url = URL(string:urlComponents) else{ return }

            var request = URLRequest(url:url)
            request.httpMethod = "GET"

            let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
            
            session.dataTask(with: request){ (data, response, error) in
                
                if error != nil{
                    print(error!)
                    completionHandler(false, nil, error!)
                    return
                }
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    
                    if let dictionaryOutput = json as? [String:Any]
                    {
                        
                        let search_result = try SearchResult(json: dictionaryOutput)
                        print(json)
                        
                        completionHandler(true, search_result, nil)
                        
                    }else
                    {
                        
                        let customError : Error = NSError(domain:"", code: 0, userInfo: [NSLocalizedDescriptionKey:"Couldn't pare jsonDictionary"])
                        completionHandler(false, nil, customError)
                    }
                    
                
                }catch
                {
                    
                    completionHandler(false,nil,error)
                    
                }
            }.resume()
        
        }
    
    
    }

