//
//  ViewController.swift
//  TreehousePopularMovies
//
//  Created by Michael Brown on 1/24/19.
//  Copyright © 2019 Michael Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    final let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=c3df1ec1d614f1f10ffb71cd1cb8a112")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
    }
    
    func fetchJSON (){
        
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            print("Downloaded")
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode([Results].self, from: data)
                print(results)
            }catch {
                print("Something wrong after downloading")
            }
            
            
            
            
            
        }.resume()
    }


}

