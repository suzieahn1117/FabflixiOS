//
//  HomeService.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/10/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import Foundation

class HomeService
{
    static func Search(searchValue : String, completionHandler : @escaping basicWebCall<SearchResult>)
    {
        var result: SearchResult;
    
        HomeRepository.searchwrap.getSearchResults(search_key: searchValue, completionHandler: completionHandler)
    }
}
