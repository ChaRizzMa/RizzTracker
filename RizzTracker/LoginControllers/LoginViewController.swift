//
//  LoginViewController.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 3/13/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBOutlet weak var CreateAccountButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Add a checker to see if the user is logged in.
        // If the user is logged in load the rest and fetch the data.
        // Else, call the signout function to completely flush the user persistence and segue to login/signup screen
        // Do any additional setup after loading the view.
    }
    
    /*
     TODO: Add segue to on login button tap if the username and password are correct
     */
    @IBAction func onLoginButtonTap(_ sender: Any) {
        print((UsernameField.text!) as String)
        // if correct credentials login:
        // performSegue(withIdentifier: "Homepage", sender: sender)
        // else: perform error handling
    }
    
    @IBAction func onCreateAccountButtonTap(_ sender: Any) {
        performSegue(withIdentifier: "CreateAccountSegue", sender: (Any).self)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
