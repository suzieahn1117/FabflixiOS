//
//  SingleMovieRepository.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/14/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import Foundation


class SingleMovieRepository: NSObject, URLSessionTaskDelegate
{
    var dataTask: URLSessionDataTask?
    static var singlemoviewrap = SingleMovieRepository()
    
    override init(){
        super.init()
    }
    
    func getSingleMovie(movieId: String, completionHandler: @escaping basicWebCall<SingleMovie>){
        
        
        dataTask?.cancel()
        
        let urlComponent = String(format: "https://fabflix-122b.appspot.com/API/Movie")
        
        guard let url = URL(string: urlComponent) else { return }
        
        let parameter = ["movieId":movieId]
        
     
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else{
            return
        }
        
        
        request.httpBody = httpBody
        

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
                    
                    let movie_info = try SingleMovie(json: dictionaryOutput)
                    print(json)
                    
                    completionHandler(true, movie_info, nil)
                    
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
    

