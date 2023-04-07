//
//  CreateAccountViewController2.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 3/20/23.
//

import UIKit

class CreateAccountViewController2: UIViewController {
    
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
    var selfRizz: Double = 0.0
    var selfAttraction: Double = 0.0
    
    var pronounList = ["He/him", "She/hers", "They/them"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onCreateAccount(_ sender: Any) {
        // print(fn, ln, email, pn, username, password, pronouns, attractionpreference, selfRizz, selfAttraction)
        
        // TODO: Add create account database push functionality
    }
}
