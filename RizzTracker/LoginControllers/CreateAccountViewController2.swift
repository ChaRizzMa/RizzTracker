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
        
        
    }
    
    func createUser() {
        var user = PFUser(username: username, email: email, password: password)
        user.firstName = fn
        user.lastName = ln
        user.phoneNumber = pn
        user.currentRizz = 0.0 // TODO: Change this to the formula
        user.friendsList = []
        user.pronouns = pronouns
        user.attractionPreference = attractionpreference
        user.initialRizz = selfRizz
        user.selfConfidence = selfAttraction
        
        // SIGN UP USER
    }
    
}
