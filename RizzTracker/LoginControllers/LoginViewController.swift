//
//  LoginViewController.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 3/13/23.
//

import UIKit
import ParseSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBOutlet weak var CreateAccountButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    var testVariable = "string"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        guard let username = UsernameField.text,
              let password = PasswordField.text,
              !username.isEmpty,
              !password.isEmpty else {

            showMissingFieldsAlert()
            return
        }
        
        // Log in the parse user
        PFUser.login(username: username, password: password) { [weak self] result in

            switch result {
            case .success(let user):
                print("✅ Successfully logged in as user: \(user)")

                // Post a notification that the user has successfully logged in.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }
        
    }
    
    @IBAction func onCreateAccountButtonTap(_ sender: Any) {
        performSegue(withIdentifier: "CreateAccountSegue", sender: (Any).self)
    }
    
    private func showAlert(description: String?) {
        let alertController = UIAlertController(title: "Unable to Log in", message: description ?? "Unknown error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "We need all fields filled out in order to log you in.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
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
