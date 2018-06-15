//
//  SingleMovie.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/14/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import Foundation


class SingleMovie: WebCallProtocol
{
    let title: String
    let year: Int?
    let director: String?
    let genres: [String]?
    let stars: [String]?
    let rating: Double?
    let numVote: Int?
    let responseCode: Int
    let responseMessage: String
    
    required init(json: [String:Any]) throws{
        
        guard let movie_title = json["title"] as? String
        else
        {
        
                    
            let customError : Error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "movieId not found"])
            throw customError
                
        }
        
        guard let movie_year = json["year"] as? Int
        else
        {
                let customError : Error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "year Not parsed"])
                throw customError
        }
        
        guard let movie_director = json["director"] as? String
        else
        {
            let customError: Error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Director not parsed"])
            throw customError
        }
        
        guard let movie_genres = json["genres"] as? [String]
        else
        {
            let customError: Error = NSError(domain:"", code: 0, userInfo: [NSLocalizedDescriptionKey: "genre is not parsed"])
            throw customError
        }
        
        guard let movie_stars = json["stars"] as? [String]
        else
        {
            let customError: Error = NSError(domain:"", code:0, userInfo: [NSLocalizedDescriptionKey: "Stars are not parsed"])
            throw customError
        }
        
        guard let movie_rating = json["rating"] as? Double
        else
        {
            let customError : Error = NSError(domain:"", code:0, userInfo: [NSLocalizedDescriptionKey: "rating is not pared"])
            throw customError
        }
        
        guard let movie_vote = json["numberOfVotes"] as? Int
        else
        {
            let customError: Error = NSError(domain:"", code:0, userInfo: [NSLocalizedDescriptionKey: "vote is not parsed"])
            throw customError
        }
        
        guard let movie_responsecode = json["responseCode"] as? Int
        else
        {
            let customError : Error = NSError(domain:"", code:0, userInfo: [NSLocalizedDescriptionKey:"responsecode not parsed"])
            throw customError
        }
        
        guard let movie_responseMessage = json["responseMessage"] as? String
        else
        {
            let customError: Error = NSError(domain:"", code:0, userInfo:[NSLocalizedDescriptionKey: "movie_response Message is not parsed"])
            throw customError
        }
        
        title = movie_title
        year = movie_year
        director = movie_director
        genres = movie_genres
        stars = movie_stars
        rating = movie_rating
        numVote = movie_vote
        responseCode = movie_responsecode
        responseMessage = movie_responseMessage


    }
    
}
