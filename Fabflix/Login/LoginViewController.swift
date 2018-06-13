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
    
    @IBAction func LetsGo(_ sender: UIButton) {
        
        let username = Username.text!
        let password = Password.text!
        
//        let vc=self.storyboard?.instantiateViewController(withIdentifier: "HomePage") as? HomeViewController

        //self.navigationController?.pushViewController( animated: true)
       
        let completionHandler: basicWebCall<LoginResult> =
        {
            Success, Content, theError  in
            
            if(Success)
            {
                
                if(Content!.responseCode == 1)
                {
                    DispatchQueue.main.async //this is asyncing to main thread
                        {
                            let vc=self.storyboard?.instantiateViewController(withIdentifier: "HomePage") as? HomeViewController
                            self.navigationController?.pushViewController(vc!, animated: true)
                    }
                    
                }
                else{
                    DispatchQueue.main.async{
                        
                    let alert = UIAlertController(title:"Alert", message:"Incorrect username or password", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title:"Dismiss", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                }
                
                
                
            }else{
                print("content: \(String(describing: Content))")
            }
        }
    
        LoginService.Login(username: username, password: password,completionHandler: completionHandler)

        }
    
}

