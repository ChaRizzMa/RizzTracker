//
//  CreateAccountViewController2.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 3/20/23.
//

import UIKit
import ParseSwift

class CreateAccountViewController2: UIViewController {
    
    
    @IBOutlet weak var pronounSelector: UIButton!
    @IBOutlet weak var attractionPreferenceSelector: UIButton!
    
    @IBOutlet weak var initialSelfRizz: UISlider!
    @IBOutlet weak var initAttraction: UISlider!
    
    // variables from other page
    var fn: String = "_fill_"
    var ln: String = "_fill_"
    var email: String = "_fill_"
    var pn: String = "_fill_"
    var username: String = "_fill_"
    var password: String = "_fill_"
    var pronouns: String = "_fill_"
    var attractionpreference: String = "_fill_"
    var selfRizz: Float = 0.0
    var selfAttraction: Float = 0.0
    
    var pronounList = ["He/him", "She/hers", "They/them"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPronounsSelector()
        setupAttractionPreferenceSelector()
        // Do any additional setup after loading the view.
    }
    
    func setupPronounsSelector() {
        
        let setPronoun = { (action: UIAction) in
            print("Pop-up action")
        } // he/him
        
        pronounSelector.menu = UIMenu(children: [
            UIAction(title: "He/Him", handler: setPronoun),
            UIAction(title: "She/Hers", handler: setPronoun),
            UIAction(title: "They/Them", handler: setPronoun)
        ])
        pronounSelector.showsMenuAsPrimaryAction = true
    }
    
    func setupAttractionPreferenceSelector() {
        let popUpButtonClosure = { (action: UIAction) in
            print("Pop-up action")
        }
        
        attractionPreferenceSelector.menu = UIMenu(children: [
            UIAction(title: "He/Him", handler: popUpButtonClosure),
            UIAction(title: "She/Hers", handler: popUpButtonClosure),
            UIAction(title: "They/Them", handler: popUpButtonClosure)
        ])
        attractionPreferenceSelector.showsMenuAsPrimaryAction = true
    }
    
    @IBAction func onCreateAccount(_ sender: Any) {
        
        print(fn, ln, email, pn, username, password, pronouns, attractionpreference, selfRizz, selfAttraction)
        selfRizz = initialSelfRizz.value
        selfAttraction = initAttraction.value
        pronouns = pronounSelector.currentTitle!
        attractionpreference = attractionPreferenceSelector.currentTitle!
        // print(selfRizz, selfAttraction, pronouns, attractionpreference)
        
        // call create User
        createUser()
    }
    
    func createUser() {
        var newUser = PFUser(username: username, email: email, password: password)
        newUser.firstName = fn
        newUser.lastName = ln
        newUser.phoneNumber = pn
        newUser.currentRizz = 0.0 // TODO: Change this to the formula
        newUser.friendsList = []
        newUser.pronouns = pronouns
        newUser.attractionPreference = attractionpreference
        newUser.initialRizz = selfRizz
        newUser.selfConfidence = selfAttraction
        
    
        newUser.signup { [weak self] result in

            switch result {
            case .success(let user):

                print("✅ Successfully signed up user \(user)")

                // Post a notification that the user has successfully signed up.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                // Failed sign up
                print(error.message)
                self?.showAlert(description: error.message)
            }
        }
        
    }
    
    private func showAlert(description: String?) {
            let alertController = UIAlertController(title: "Unable to Sign Up", message: description ?? "Unknown error", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            present(alertController, animated: true)
        }

    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "We need all fields filled out in order to sign you up.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
}
