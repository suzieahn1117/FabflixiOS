//
//  HomeViewController.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/9/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,  UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource
{
   
   
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBAction func SignOut(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }

    
     @IBOutlet weak var SearchResultTable: UITableView!
    
    @IBOutlet weak var HomePageActivity: UIActivityIndicatorView!
    
     var ovie_list: [SearchResult.Movie] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        SearchResultTable.tableFooterView = UIView()
        SearchBar.delegate=self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ovie_list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let movie = ovie_list[indexPath.row]
        cell.textLabel?.text = movie.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewWillAppear(true)
        
//        let singlemovie_id = SearchResultTable.indexPathForSelectedRow
//        let current_cell = SearchResultTable.cellForRow(at: singlemovie_id!)
//
        let single_movie=self.storyboard?.instantiateViewController(withIdentifier: "SingleMovieView") as? SingleMovieViewController
        single_movie?.movie_id = ovie_list[indexPath.row].id
        self.navigationController?.pushViewController(single_movie!, animated: true)
    
    }
    

    func searchBarSearchButtonClicked(_ SearchBar: UISearchBar)
    {
     
        self.HomePageActivity.startAnimating()
        
        
        var completionHandler : basicWebCall<SearchResult> =
        {
            Success, Content, theError in
            
            //This will happen in the background thread
            if (Success)
            {
                
                self.ovie_list = (Content?.movies)!
          
                DispatchQueue.main.async{
                     self.HomePageActivity.stopAnimating()
                    self.SearchResultTable.reloadData()
                }
                
            }
            else
            {
                self.HomePageActivity.stopAnimating()
                print("hello home error")
                
            }
        }
        
        HomeService.Search(searchValue: SearchBar.text!, completionHandler: completionHandler)
        
        
    }
    
    
    
    



}
