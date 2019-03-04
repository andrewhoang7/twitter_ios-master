//
//  LoginViewController.swift
//  Twitter
//
//  Created by Andrew Hoang on 2/24/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome"
                , sender: self)
        }
    }
    
    
//Action linked to
    @IBAction func onLoginButton(_ sender: Any) {
        
        //variable for Resource URL for twitter authentication
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        //If successful, login to home
        //If failure, display message
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            //User Default to remember login, even when app closes out
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome"
                , sender: self)
        
        }, failure: { (Error) in
            print("Incorrect password. Could not log in.")
        })    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
