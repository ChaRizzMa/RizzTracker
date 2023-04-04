//
//  CreateAccountViewController.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 3/13/23.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var fullnameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func onAccountCreationNext(_ sender: Any) {
        print((emailAddressField.text!) as String)
        performSegue(withIdentifier: "CreateAccountSegue2", sender: Any?.self)
    }
    
    // TODO: Figure out if we have to pass data thru
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateAccountSegue2", let nextpage = segue.destination as? CreateAccountViewController2 {
            return
        }
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
