//
//  ViewController.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/9/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{

   
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var SujiActivity: UIActivityIndicatorView!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func LetsGo(_ sender: UIButton) {
        
        let username = Username.text!
        let password = Password.text!
        
        sender.isEnabled=false
        SujiActivity.startAnimating()
       
        let completionHandler: basicWebCall<LoginResult> =
        {
            Success, Content, theError  in
            
            if(Success)
            {
                
                if(Content!.responseCode == 1)
                {
                    DispatchQueue.main.async //this is a syncing to main thread
                        {
                            let vc=self.storyboard?.instantiateViewController(withIdentifier: "HomePage") as? HomeViewController
                            self.navigationController?.pushViewController(vc!, animated: true)
                    }
                    
                }
                else{
                    
                    
                    DispatchQueue.main.async{
                        
                    let alert = UIAlertController(title:"Alert", message:Content?.responseMessage, preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title:"Dismiss", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)

                    }
                }
                
            }
            else
            {
                print("content: \(String(describing: Content))")
            }
            
            DispatchQueue.main.async
            {
                    sender.isEnabled = true
                    self.SujiActivity.stopAnimating()
            }
        }
    
        LoginService.Login(username: username, password: password,completionHandler: completionHandler)

        }
    
 
    
}

