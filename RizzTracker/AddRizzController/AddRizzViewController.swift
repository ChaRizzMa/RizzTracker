//
//  AddRizzViewController.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 4/9/23.
//

import UIKit


// TODO: Adjust layout of the thing!
class AddRizzViewController: UIViewController {
    
    // init all input/labels
    // labels
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var question3: UILabel!
    @IBOutlet weak var question4: UILabel!
    @IBOutlet weak var question5: UILabel!
    @IBOutlet weak var question6: UILabel!
    
    // text fields
    @IBOutlet weak var question1Field: UITextField!
    @IBOutlet weak var question2Field: UITextField!
    @IBOutlet weak var question3Field: UITextField!
    @IBOutlet weak var question4Field: UITextField!
    @IBOutlet weak var question5Field: UITextField!
    @IBOutlet weak var question6Field: UITextField!
    
    var user: PFUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pronoun1 = "-1"
        var pronoun2 = "-1"
        var pronoun3 = "-1"
        
        Task {
            do {
                user = try await PFUser.current()
                print("Add Rizz: ✅", user)
                print("Attraction Preferences ✅", user?.attractionPreference ?? "-1")
                let attractionPreferences = user?.attractionPreference ?? "-1"
                if attractionPreferences == "He/Him" {
                    print("Attracted to men")
                    pronoun1 = "He"
                    pronoun2 = "Him"
                    pronoun3 = "Men"
                } else if attractionPreferences == "She/Hers" {
                    print("Attracted to women")
                    pronoun1 = "She"
                    pronoun2 = "Her"
                    pronoun3 = "Women"
                } else if attractionPreferences == "They/Them" {
                    print("Attracted to them")
                    pronoun1 = "They"
                    pronoun2 = "Them"
                    pronoun3 = "People"
                }
                
                question1.text = "1. How many “damn \(pronoun1.lowercased()) bad's\" did you think or say to yourself tonight?"
                question2.text = "2. How many “\(pronoun1.lowercased()) want me fr fr's” did you think or say to yourself tonight?"
                question3.text = "3. How many “I’m going to talk to \(pronoun2.lowercased())”s did you think or say to yourself tonight?"
                question4.text = "4. How many \(pronoun3.lowercased()) did you talk to?"
                question5.text = "5. How many numbers, Instagrams, Snapchats, etc, have you gotten?"
                question6.text = "6. Please write a description of what happened."
                
                question1Field.text = String(0)
                question1Field.text = String(0)
                question1Field.text = String(0)
                question1Field.text = String(0)
                question1Field.text = String(0)
                question1Field.text = ""
                
            } catch let error {
                print("An error occurred: \(error)")
            }
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        var newRizzult = Rizzults(
            owner: user?.username,
            objectID: user?.objectId,
            badsQuantity: Int(question1Field.text ?? "0"),
            wantMeFrFRQuantity: Int(question2Field.text ?? "0"),
            goingToTalkToQuantity: Int(question3Field.text ?? "0"),
            howManyTalkedTo: Int(question4Field.text ?? "0"),
            numberComunications: Int(question5Field.text ?? "0"),
            descriptionOfSituation: question6Field.text ?? "Null"
        )
        
        
        
        newRizzult.save {
            result in
                switch result {
                case .success(_):
                    print("✅ Parse Object SAVED!")
                case .failure(let error):
                    assertionFailure("Error saving: \(error)")
                }
        }
        
        // append this object ID into the rizzults array in teh database
        
        // after submit, reset page or
    }
    
    
    

}
