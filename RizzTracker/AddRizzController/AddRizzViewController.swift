//
//  AddRizzViewController.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 4/9/23.
//

import UIKit


class AddRizzViewController: UIViewController {

    //labels
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var question3: UILabel!
    @IBOutlet weak var question4: UILabel!
    @IBOutlet weak var question5: UILabel!
    @IBOutlet weak var question6: UILabel!
    
    //text fields
    @IBOutlet weak var question1Field: UITextField!
    @IBOutlet weak var question2Field: UITextField!
    @IBOutlet weak var question3Field: UITextField!
    @IBOutlet weak var question4Field: UITextField!
    @IBOutlet weak var question5Field: UITextField!
    @IBOutlet weak var question6Field: UITextField!
    
    //errors
    @IBOutlet weak var error1: UILabel!
    @IBOutlet weak var error2: UILabel!
    @IBOutlet weak var error3: UILabel!
    @IBOutlet weak var error4: UILabel!
    @IBOutlet weak var error5: UILabel!
    
    //button
    @IBOutlet weak var submitButton: UIButton!
    
    var user: PFUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetFourm()
        
        var pronoun1 = "-1"
        var pronoun2 = "-1"
        var pronoun3 = "-1"
        
        Task {
            do {
                user = try await PFUser.current()
                let attractionPreferences = user?.attractionPreference ?? "-1"
                if attractionPreferences == "He/Him" {
                    pronoun1 = "He"
                    pronoun2 = "Him"
                    pronoun3 = "Men"
                } else if attractionPreferences == "She/Hers" {
                    pronoun1 = "She"
                    pronoun2 = "Her"
                    pronoun3 = "Women"
                } else if attractionPreferences == "They/Them" {
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
                
            } catch let error {
                print("An error occurred: \(error)")
            }
        }
    }
    
    func resetFourm(){
        
        submitButton.isEnabled = false
        
        error1.isHidden = false
        error2.isHidden = false
        error3.isHidden = false
        error4.isHidden = false
        error5.isHidden = false
        
        error1.text = "Required"
        error2.text = "Required"
        error3.text = "Required"
        error4.text = "Required"
        error5.text = "Required"
        
        question1Field.text = ""
        question2Field.text = ""
        question3Field.text = ""
        question4Field.text = ""
        question5Field.text = ""
        question6Field.text = ""
    }
    
    //Validations
    @IBAction func questionChange1(_ sender: Any) {
        if let value = question1Field.text{
            if let errorMessage = invalidNumber(value){
                error1.text = errorMessage
                error1.isHidden = false
            }else{
                error1.isHidden = true
            }
        }
        checkForValidForm()
    }
    @IBAction func questionChange2(_ sender: Any) {
        if let value = question2Field.text{
            if let errorMessage = invalidNumber(value){
                error2.text = errorMessage
                error2.isHidden = false
            }else{
                error2.isHidden = true
            }
        }
        checkForValidForm()
    }
    @IBAction func questionChange3(_ sender: Any) {
        if let value = question3Field.text{
            if let errorMessage = invalidNumber(value){
                error3.text = errorMessage
                error3.isHidden = false
            }else{
                error3.isHidden = true
            }
        }
        checkForValidForm()
    }
    @IBAction func questionChange4(_ sender: Any) {
        if let value = question4Field.text{
            if let errorMessage = invalidNumber(value){
                error4.text = errorMessage
                error4.isHidden = false
            }else{
                error4.isHidden = true
            }
        }
        checkForValidForm()
    }
    @IBAction func questionChange5(_ sender: Any) {
        if let value = question5Field.text{
            if let errorMessage = invalidNumber(value){
                error5.text = errorMessage
                error5.isHidden = false
            }else{
                error5.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    //Check if value is a number
    func invalidNumber(_ value: String) -> String?{
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) || value == ""{
            return "Value must contain digits only"
        }
        return nil
    }
    
    //check if all forms submited
    func checkForValidForm(){
        if error1.isHidden && error2.isHidden && error3.isHidden && error4.isHidden && error5.isHidden{
            submitButton.isEnabled = true
        }else{
            submitButton.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        //Calc Rizz, idk what im doing LOL
        let a =  Double(question1Field.text!)!
        let b =  Double(question2Field.text!)!
        let c =  Double(question3Field.text!)!
        let d =  Double(question4Field.text!)!
        let e =  Double(question5Field.text!)!
        
        let aTerm = a * 0.001
        let bTerm = b * 0.001
        let cTerm = c * 0.01
        let dTerm = d * 0.15
        let eTerm = e * 0.30

        var overall = (aTerm + bTerm + cTerm + dTerm + eTerm) * 100

        if overall > 100 {
            overall = 100
        }
        print(Int(overall))
        
        let newRizzult = Rizzults(
            owner: user?.username,
            objectID: user?.objectId,
            ownerRizz: Int(overall),
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
        resetFourm()
    }
}
