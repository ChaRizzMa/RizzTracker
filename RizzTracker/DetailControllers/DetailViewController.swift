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
    @IBOutlet weak var emojiRating: UILabel!
    @IBOutlet weak var textRating: UILabel!
    
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
            emojiRating.text = "No Data"
            textRating.text = "No Data"
        } else {
            damnBadLabel.text = "\(rizzult?.badsQuantity ?? -1)x Damn \(pronoun1.lowercased()) bad"
            wantMeFrLabel.text = "\(rizzult?.wantMeFrFRQuantity ?? -1)x \(pronoun1) want me frfr"
            goingToTalkLabel.text = "\(rizzult?.goingToTalkToQuantity ?? -1)x I'm going to talk to \(pronoun2.lowercased())"
            numberTalkedToLabel.text = "\(rizzult?.howManyTalkedTo ?? -1)x \(pronoun3) talked to"
            commsGottenLabel.text = "\(rizzult?.numberComunications ?? -1)x Numbers gotten"
            notesLabel.text = "\(rizzult?.descriptionOfSituation ?? "No Data")"
            
            
            var check  = rizzult?.ownerRizz ?? -1
            
            if case -1...50 = check {
                emojiRating.textColor = UIColor.red
                emojiRating.text = "🤣 L Rizz"
                textRating.text = "But it's okay!"
            } else if case 51...70 = check {
                emojiRating.textColor = UIColor.orange
                emojiRating.text = "😕 Mid Rizz!"
                textRating.text = "You can do better!"
            } else if case 71...80 = check {
                emojiRating.textColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 1)
                emojiRating.text = "😏 Valid Rizz!"
                textRating.text = "Almost a W!"
            } else if case 81...100 = check {
                emojiRating.textColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 1)
                emojiRating.text = "🙌 W Rizz!"
                textRating.text = "Congrats!"
            }
        }
    }
}
