//
//  CreateAccountViewController.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 3/13/23.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    
    @IBOutlet weak var firstnameField: UITextField!
    
    @IBOutlet weak var lastnameField: UITextField!
    
    @IBOutlet weak var emailaddressField: UITextField!
    
    @IBOutlet weak var phonenumberField: UITextField!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmpasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameField.text = ""
        lastnameField.text = ""
        emailaddressField.text = ""
        phonenumberField.text = ""
        usernameField.text = ""
        passwordField.text = ""
        confirmpasswordField.text = ""

        // Do any additional setup after loading the view.
    }

    @IBAction func onAccountCreationNext(_ sender: Any) {
        
        print((firstnameField.text!) as String)
        print((lastnameField.text!) as String)
        print((emailaddressField.text!) as String)
        print((phonenumberField.text!) as String)
        print((usernameField.text!) as String)
        print((passwordField.text!) as String)
        
        performSegue(withIdentifier: "CreateAccountSegue2", sender: Any?.self)
    }
    
    // TODO: Figure out if we have to pass data thru
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateAccountSegue2", let nextpage = segue.destination as? CreateAccountViewController2 {
            nextpage.fn = firstnameField.text!
            nextpage.ln = lastnameField.text!
            nextpage.email = emailaddressField.text!
            nextpage.pn = phonenumberField.text!
            nextpage.username = usernameField.text!
            nextpage.password = passwordField.text!
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
