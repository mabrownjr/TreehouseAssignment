//
//  Movie.swift
//  TreehousePopularMovies
//
//  Created by Michael Brown on 1/24/19.
//  Copyright © 2019 Michael Brown. All rights reserved.
//

import UIKit

class Results: Codable {
    let results: [Result]
    
    init(results: [Result]) {
        self.results = results
    }
}

class Result: Codable {
    let title: String
    let image: String
    let release_date: String
    
    init(title: String, image: String, release_date: String) {
        self.title = title
        self.image = image
        self.release_date = release_date
    }
    
}
