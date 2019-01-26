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
    final let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=c3df1ec1d614f1f10ffb71cd1cb8a112&language=en-US&page=1")
    
    // Declaring local array of type "Movie"
    private var moviesResults = [Movie]()
    
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
            
            //try-catch to make sure the data is decoded into Results Model
            do {
                let decoder = JSONDecoder()
                let downloadedResults = try decoder.decode(Results.self, from: data)
                
                // Decoded data from JSON is placed into movieResults array of type Movies
                self.moviesResults = downloadedResults.results
                //Switching the main thread to this to reload the table view
                DispatchQueue.main.async {
                      self.tableView.reloadData()
                }
              
            }catch {
                print(error)
            }
            
            
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Table view will print out table cells of movieResults total array count
        return moviesResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Identidying and initiating the cell for output within cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? PopularMovieCell else { return UITableViewCell()}
        
        //Appends the title of movie matching row position with array index position
        cell.titleLabel.text = moviesResults[indexPath.row].title
        //Appends the release date of movie matching row position with array index position
        cell.releaseDateLabel.text = moviesResults[indexPath.row].releaseDate
        
        // Returning the entire cell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indextPath: IndexPath){
//        let vc = storyboard?.instantiateViewController(withIdentifier: "MovieOverViewController") as! MovieOverViewController
//        self.navigationController?.pushViewController(vc, animated: true)
//    
//    }


}

