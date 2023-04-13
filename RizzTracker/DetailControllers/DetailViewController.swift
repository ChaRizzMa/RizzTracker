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
            
            if(rizzult?.ownerRizz ?? -1 > 70){
                emojiRating.textColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 1)
                emojiRating.text = "🙌 W Rizz!"
                textRating.text = "Congrats!"
            }else{
                emojiRating.textColor = UIColor.red
                emojiRating.text = "🤣 L Rizz"
                textRating.text = "But it's okay!"
            }
        }
    }
}
