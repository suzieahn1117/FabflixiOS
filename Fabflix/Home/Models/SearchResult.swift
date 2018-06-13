//
//  SearchResult.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/10/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import Foundation

class SearchResult : WebCallProtocol
{
    let movies: [Movie]
    let responseCode: Int
    let responseMessage: String
    
    required init(json: [String : Any]) throws {

        var movie_list: [Movie] = []
        
        guard let movie_array = json["movies"] as? [[String:Any]]
            else{
                
                let customError : Error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "customer id not found"])
                throw customError
            }
        
        for movie in movie_array{
            let movie_info = try Movie(json: movie)
            movie_list.append(movie_info)
            
            
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
        
        responseCode = code
        responseMessage = message
        movies = movie_list
        
    }
    
    class Movie
    {
        let title: String
        let year: Int
        let director: String
        let genres: String?
        let stars: String?
    
        required init(json: [String : Any]) throws
        {
    
    
            guard let movie_title = json["title"] as? String
            else{
                let customError : Error = NSError(domain:"", code: 0, userInfo: [NSLocalizedDescriptionKey:"Couldn't parse jsonDictionary - title"])
                throw customError
            }
    
            guard let movie_year = json["year"] as? Int
                else{
                    let customError: Error = NSError(domain:"", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't parse jsonDictionary - year"])
                    throw customError
            }
    
            guard let movie_dir = json["director"] as? String
                else{
                    let customError: Error = NSError(domain:"", code: 0, userInfo: [NSLocalizedDescriptionKey: "Couldn't parse jsonDictionary - director"])
                    throw customError
            }
    
            title = movie_title
            year = movie_year
            director = movie_dir
            genres = nil
            stars = nil
        }
    
        
    }
    
    

   
    
    
}
