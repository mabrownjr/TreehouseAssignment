//
//  ViewController.swift
//  TreehousePopularMovies
//
//  Created by Michael Brown on 1/24/19.
//  Copyright © 2019 Michael Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    // JSON Url with API Key
    final let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=c3df1ec1d614f1f10ffb71cd1cb8a112")
    
    // Declaring local array of type "Movie"
    private var moviesResults: Movie?
    
    // Outlet attachment to the TableView in the storyboard
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
    }
    
    // Function that grabs the JSON data
    func fetchJSON (){
        
        
        // Initializing local variable of URL in fetchJSON
        guard let jsonURL = url else { return }
        // fetching the contents of a jsonURL to memory
        URLSession.shared.dataTask(with: jsonURL) { data, urlResponse, error in
            
             /*Check for data response from the network request if no data was received
             or if the data is nil. If so, print error message "Something is wrong", else
             confirm download*/
            guard let data = data, error == nil, urlResponse != nil else {
                // Test if the data is not empty and has downloaded, print "Downloaded"
                print("Download didn't work")
                return
            }
            // Printing string to check if data was downloaded
            print("Downloaded")
            
            do {
                let decoder = JSONDecoder()
                let downloadedResults = try decoder.decode(Movie.self, from: data)
                self.moviesResults = downloadedResults
                print(self.moviesResults as Any)
//                DispatchQueue.main.async {
//                      self.tableView.reloadData()
//                }
              
            }catch {
                print(error)
            }
            
            
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? PopularMovieCell else { return UITableViewCell()}
        
//        cell.titleLabel.text = results[indexPath.row].title
//        cell.releaseDateLabel.text = results[indexPath.row].release_date
        
        return cell
    }


}

