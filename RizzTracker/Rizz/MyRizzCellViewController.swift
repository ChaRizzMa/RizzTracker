//
//  MyRizzCellViewController.swift
//  RizzTracker
//
//  Created by Nicholas de Souza on 4/9/23.
//

import UIKit
import ParseSwift

class MyRizzCellViewController: UIViewController {
    
    @IBOutlet weak var lblIntro: UILabel!
    @IBOutlet weak var lblOVR: UILabel!
    @IBOutlet weak var lblSheBad: UILabel!
    @IBOutlet weak var lblSheWant: UILabel!
    @IBOutlet weak var lblToTalk: UILabel!
    @IBOutlet weak var lblWomanTalked: UILabel!
    @IBOutlet weak var lblNumGot: UILabel!
    
    @IBOutlet weak var lblProDamnBad: UILabel!
    @IBOutlet weak var lblProSheWant: UILabel!
    @IBOutlet weak var lblProToTalk: UILabel!
    @IBOutlet weak var lblProTalkedTo: UILabel!
    
    @IBOutlet weak var lblSubmittedRizz: UILabel!
    @IBOutlet weak var lblInitialRizz: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhoneNum: UILabel!
    @IBOutlet weak var lblPronouns: UILabel!
    @IBOutlet weak var lblPref: UILabel!
    
    let query = Rizzults.query()
    var user: PFUser?
    var rizzult: [Rizzults] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    private func getData() {
        var pronoun1 = ""
        var pronoun2 = ""
        var pronoun3 = ""
        
        //var sheBad, sheWant, toTalk, womanTalked, numGot: Int
        
        Task {
            do {
                user = try await PFUser.current()
                print(user as Any)
                print("My Rizz: ✅", user ?? "")
                
                let query = Rizzults.query("ownerUUID" == user?.objectId)
                var rizzults: [Rizzults] = []
                var damnBads = 0.0
                var wantMefrfr = 0.0
                var goingToTalk = 0.0
                var talkedTo = 0.0
                var numsGotten = 0.0
                
                let data = try await query.findAll()
                DispatchQueue.main.async {
                    rizzults = data
                    rizzults = rizzults.sorted(by: { $0.updatedAt ?? Date.distantPast > $1.updatedAt ?? Date.distantPast })
                }
                print("Data Size: ", data.count)
                
                if (data.count >= 1) {
                    for r in data {
                        damnBads += Double(r.badsQuantity!)
                        wantMefrfr += Double(r.wantMeFrFRQuantity!)
                        goingToTalk += Double(r.goingToTalkToQuantity!)
                        talkedTo += Double(r.howManyTalkedTo!)
                        numsGotten += Double(r.numberComunications!)
                    }
                } else {
                    // user has no rizzults
                }
                
                print(self.rizzult)
                
                let fName = user?.firstName ?? "-1"
                let lName = user?.lastName ?? "-1"
                let object = user?.objectId
                
                lblIntro.text = String("Hello \(fName) \(lName)! Here are Your All Time Rizz Stats:")
                
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
                
                // Number label assignments
                lblOVR.text = String(user?.currentRizz ?? -1)
                lblSheBad.text = String(format: "%.1f", damnBads/Double(data.count))
                lblSheWant.text = String(format: "%.1f",wantMefrfr/Double(data.count))
                lblToTalk.text = String(format: "%.1f",goingToTalk/Double(data.count))
                lblWomanTalked.text = String(format: "%.1f",talkedTo/Double(data.count))
                lblNumGot.text = String(format: "%.1f",numsGotten/Double(data.count))
                
                // Pronoun assignments
                lblProDamnBad.text = "Damn \(pronoun1.lowercased()) Bad's"
                lblProSheWant.text = "\(pronoun1) Want me fr fr's"
                lblProToTalk.text = "Going to talk to \(pronoun2.lowercased())'s"
                lblProTalkedTo.text = "\(pronoun3) talked to"
                
                // Other Stats
                lblSubmittedRizz.text = String(data.count)
                let initialRizz = NSString(format: "%.0f", user!.initialRizz ?? "")
                lblInitialRizz.text = String(initialRizz)
                
                lblEmail.text = user!.email ?? ""
                lblPhoneNum.text = user!.phoneNumber ?? ""
                lblPronouns.text = user!.pronouns ?? ""
                lblPref.text = user!.attractionPreference ?? ""
                
            } catch let error {
                print("An error occurred: \(error)")
            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onRefreshTap(_ sender: Any) {
        print("Refresh")
        viewDidLoad()
    }
    
    @IBAction func onLogOutTapped(_ sender: Any) {
        Task { @MainActor in
            await showConfirmLogoutAlert()
        }
    }
    
    private func showConfirmLogoutAlert() async {
        do {
            let currentUser = try await PFUser.current()
            let alertController = UIAlertController(title: "Log out of \(currentUser.username ?? "current account")?", message: nil, preferredStyle: .alert)
            let logOutAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
                NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alertController.addAction(logOutAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        } catch {
            // Handle the error here
            print("Error: \(error.localizedDescription)")
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

