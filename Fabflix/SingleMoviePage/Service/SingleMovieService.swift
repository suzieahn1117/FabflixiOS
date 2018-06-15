//
//  SingleMovieService.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/14/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import Foundation


class SingleMovieService{
    
    static func SingleMovieSearch(movieId : String, completionHandler : @escaping basicWebCall<SingleMovie>)
    {
        
        SingleMovieRepository.singlemoviewrap.getSingleMovie(movieId: movieId, completionHandler: completionHandler)
    }
}
