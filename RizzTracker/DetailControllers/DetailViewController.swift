//
//  DetailViewController.swift
//  RizzTracker
//
//  Created by Daniel Ruiz on 4/9/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var rizzult: Rizzults?
    var user: PFUser?
    
    @IBOutlet weak var damnBadLabel: UILabel!
    @IBOutlet weak var wantMeFrLabel: UILabel!
    @IBOutlet weak var goingToTalkLabel: UILabel!
    @IBOutlet weak var numberTalkedToLabel: UILabel!
    @IBOutlet weak var commsGottenLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pronoun1 = ""
        var pronoun2 = ""
        var pronoun3 = ""
        if user?.attractionPreference == "He/Him" {
            pronoun1 = "He"
            pronoun2 = "Him"
            pronoun3 = "Men"
        } else if user?.attractionPreference == "She/Hers" {
            pronoun1 = "She"
            pronoun2 = "Her"
            pronoun3 = "Women"
        } else {
            pronoun1 = "They"
            pronoun2 = "Them"
            pronoun3 = "People"
        }

        if (rizzult == nil) {
            damnBadLabel.text = "No Data"
            wantMeFrLabel.text = "No Data"
            goingToTalkLabel.text = "No Data"
            numberTalkedToLabel.text = "No Data"
            commsGottenLabel.text = "No Data"
            notesLabel.text = "No Data"
        } else {
            damnBadLabel.text = "\(String(describing: rizzult?.badsQuantity))x Damn \(pronoun1) bad"
            wantMeFrLabel.text = "\(String(describing: rizzult?.wantMeFrFRQuantity))x Damn \(pronoun1) bad"
            goingToTalkLabel.text = "\(String(describing: rizzult?.goingToTalkToQuantity))x Damn \(pronoun1) bad"
            numberTalkedToLabel.text = "\(String(describing: rizzult?.howManyTalkedTo))x Damn \(pronoun1) bad"
            commsGottenLabel.text = "\(String(describing: rizzult?.numberComunications))x Damn \(pronoun1) bad"
            notesLabel.text = "\(String(describing: rizzult?.descriptionOfSituation))"
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
