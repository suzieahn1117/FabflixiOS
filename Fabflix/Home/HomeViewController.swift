//
//  HomeViewController.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/9/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,  UISearchBarDelegate {

    @IBOutlet weak var SearchBar: UISearchBar!
    
   
    
    @IBAction func SignOut(_ sender: UIBarButtonItem) {
       dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        SearchBar.delegate=self
        
    }
    
    func searchBarSearchButtonClicked(_ SearchBar: UISearchBar)
    {
        print(SearchBar.text!)
        
        var completionHandler : basicWebCall<SearchResult> =
        {
            Success, Content, theError in
            
            //This will happen in the background thread
            if (Success)
            {
                print(theError!)
                print(Content!)
            }
            else
            {
                print("hello home error")
                
            }
        }
        
        HomeService.Search(searchValue: SearchBar.text!, completionHandler: completionHandler)
        
        
    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
