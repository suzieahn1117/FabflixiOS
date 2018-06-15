//
//  SingleMovieViewController.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/14/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import UIKit

class SingleMovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    //UIVIews
    @IBOutlet weak var UltimateView: UIView!
    @IBOutlet weak var SujiActivation: UIActivityIndicatorView!
    
    
    //UILabels
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DirectorLabel: UILabel!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var RateLabel: UILabel!
    @IBOutlet weak var VoteLabel: UILabel!
    
    //UITableView
    @IBOutlet weak var StarsTable: UITableView!
    @IBOutlet weak var GenresTable: UITableView!
    
    @IBAction func goBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Private Variables
    var listOfStars : [String] = []
    var listOfGenres : [String] = []
    var movie_id : String = ""

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        UltimateView.isHidden = true
        
        StarsTable.tableFooterView = UIView()
        GenresTable.tableFooterView = UIView()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getMovieResult()

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (tableView == StarsTable)
        {
            return listOfStars.count
        }
        
        return listOfGenres.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (tableView == StarsTable)
        {
           return "Stars"
        }
        else
        {
            return "Genres"
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
        if (tableView == StarsTable)
        {
            cell.textLabel?.text = listOfStars[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = listOfGenres[indexPath.row]
        }
        
        return cell
    }
    
    
    
   func getMovieResult(){
        self.SujiActivation.startAnimating()
    
        
        var completionHandler: basicWebCall<SingleMovie> =
        {
            Success, Content, theError in
            
            if (Success)
            {
                

                self.listOfGenres = (Content?.genres)!
                self.listOfStars = (Content?.stars)!
                
                
                DispatchQueue.main.async
                    {
                        
                        self.SujiActivation.stopAnimating()
                        self.TitleLabel.text = Content?.title
                        self.DirectorLabel.text = Content?.director
                        
                        let year = Content?.year!
                        self.YearLabel.text = String(year!)
                        let rated = Content?.rating!
                        self.RateLabel.text = String(rated!)
                        let vo = Content?.numVote!
                        self.VoteLabel.text = String(vo!)

                        self.UltimateView.isHidden=false
                        self.GenresTable.reloadData()
                        self.StarsTable.reloadData()
                }
            }
            else
            {
                print(theError)
            }
            
            
        }
    print("movieid: \(movie_id)")
        SingleMovieService.SingleMovieSearch(movieId: movie_id, completionHandler: completionHandler)
    }
    
    

  


}
