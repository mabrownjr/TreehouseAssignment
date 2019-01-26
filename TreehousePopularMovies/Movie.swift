//
//  Movie.swift
//  TreehousePopularMovies
//
//  Created by Michael Brown on 1/24/19.
//  Copyright © 2019 Michael Brown. All rights reserved.
//

import UIKit

// Results class to use an array property to hold the JSON array data of type Movies
class Results: Codable {
    let results: [Movie]
    
    init(results: [Movie]) {
        self.results = results
    }

    // Safe guarding the proper key needed to read the data
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

// Movie Class for matching the properties with the JSON data within the results array
class Movie: Codable {
    let title: String
    let releaseDate: String
    
    //Initializing constructor for Movie opject
    init(title: String, releaseDate: String, posterPath: String) {
        self.title = title
        self.releaseDate = releaseDate
        
        
    }
    
    // Safe guarding the proper keys needed to read data within array
    enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
    }
    
}
