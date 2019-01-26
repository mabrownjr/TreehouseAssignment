//
//  Movie.swift
//  TreehousePopularMovies
//
//  Created by Michael Brown on 1/24/19.
//  Copyright © 2019 Michael Brown. All rights reserved.
//

import UIKit

class Results: Codable {
    let page: Int
    let results: [Movie]
    let total_results: Int
    let total_pages: Int
    
    init(page: Int, results: [Movie], total_results: Int, total_pages: Int) {
        self.page = page
        self.results = results
        self.total_results = total_results
        self.total_pages = total_pages
    }

    enum CodingKeys: String, CodingKey {
        case page
        case results = "results"
        case total_results = "total_results"
        case total_pages = "total_pages"
    }
}

// Movie Class fro 
class Movie: Codable {
    let title: String
    let releaseDate: String
    
    init(title: String, releaseDate: String) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
    }
    
}
